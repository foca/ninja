require File.dirname(__FILE__) + "/helper"
require "ninja/threaded"

class ThreadedNinjaTest < NinjaTest
  test "with a successful threaded build" do
    Thread.abort_on_exception = true
    Ninja.hide_in = Ninja::Threaded.new(5)
    x = 1
    in_background { x += 4 }
    Ninja.hide_in.wait!

    assert_equal 5, x
  end

  class FakeLogger
    attr_reader :msg

    def error(msg)
      @msg = msg
    end
  end

  test "when something goes wrong" do
    logger = FakeLogger.new

    engine = Ninja::Threaded.new(2, logger)
    engine.call(proc { fail "foo" })
    engine.wait!

    assert_equal "Exception occured during build: foo", logger.msg
  end
end

