require "test/unit"
require "contest"
$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../lib")
require "ninja"

begin
  require "redgreen"
rescue LoadError
end

if ENV["DEBUG"]
  require "ruby-debug"
else
  def debugger
    puts "Run your tests with DEBUG=1 to use the debugger"
  end
end

Ninja.hide_in = Ninja::PlainSight

class NinjaTest < Test::Unit::TestCase
  include Ninja

  def self.test(name, &test)
    super(name) do
      old_engine = Ninja.hide_in
      instance_eval(&test)
      Ninja.hide_in = old_engine
    end
  end
end
