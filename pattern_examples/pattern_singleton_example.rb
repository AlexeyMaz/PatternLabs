class Singleton
  @@instance = nil

  def self.instance
    @@instance ||= new
  end

  private_class_method :new

  def action
    puts "I'm doing something"
  end
end


s1 = Singleton.instance
s2 = Singleton.instance

puts s1.equal?(s2) # true

s1.action # "I'm doing something"
s2.action # "I'm doing something"
