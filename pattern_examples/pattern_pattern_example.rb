class OrderProcessor
def process_order
  select_products
  calculate_total_price
  create_invoice
  send_confirmation_email
end

def select_products
  raise NotImplementedError, 'Будет реализовано в наследнике'
end

def calculate_total_price
  raise NotImplementedError, 'Будет реализовано в наследнике'
end

def create_invoice
  puts 'Накладная создана'
end

def send_confirmation_email
  puts 'Письмо-подтверждение создано'
end
end


class OnlineOrderProcessor < OrderProcessor
  def select_products
    puts 'Selecting products online.'
  end

  def calculate_total_price
    puts 'Calculating total price online.'
  end
end


online_order = OnlineOrderProcessor.new
online_order.process_order
