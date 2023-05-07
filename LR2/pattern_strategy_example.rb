class Context
  attr_writer :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def perform_action
    @strategy.do_something
  end
end

class StrategyA
  def do_something
    puts 'Strategy A'
  end
end

class StrategyB
  def do_something
    puts 'Strategy B'
  end
end


context = Context.new(StrategyA.new)
context.perform_action

context.strategy = StrategyB.new
context.perform_action
