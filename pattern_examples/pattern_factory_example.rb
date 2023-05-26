# Абстрактный класс или интерфейс продукта
class Product
  def operation
    raise NotImplementedError, "#{self.class} должен реализовать метод operation"
  end
end

# Конкретный класс продукта
class ConcreteProductA < Product
  def operation
    "Работаю как продукт A"
  end
end

# Конкретный класс продукта
class ConcreteProductB < Product
  def operation
    "Работаю как продукт B"
  end
end

# Фабрика
class Factory
  def create_product(type)
    case type
    when :product_a
      ConcreteProductA.new
    when :product_b
      ConcreteProductB.new
    else
      raise ArgumentError, "Неизвестный тип продукта: #{type}"
    end
  end
end

# Использование паттерна Фабрика
factory = Factory.new

product_a = factory.create_product(:product_a)
puts product_a.operation
# Вывод: "Работаю как продукт A"

product_b = factory.create_product(:product_b)
puts product_b.operation
# Вывод: "Работаю как продукт B"
