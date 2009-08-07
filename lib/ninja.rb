module Ninja
  class << self
    attr_accessor :hide_in
  end

  PlainSight = lambda {|b| b.call }
  self.hide_in = PlainSight

  def in_background(&block)
    Ninja.hide_in.call(block)
  end
end
