require 'mysql2'

##
# Источник данных из БД
class DBDataSource
  private_class_method :new
  @instance_mutex = Mutex.new

  def initialize
    # db_config = YAML.load_file('source/db_config/config.yaml').transform_keys(&:to_sym)
    @client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "12345", :database => "university")
    @client.query_options.merge!(symbolize_keys: true)
  end

  def self.instance
    return @instance if @instance

    @instance_mutex.synchronize do
      @instance ||= new
    end

    @instance
  end

  def prepare_exec(statement, *params)
    @client.prepare(statement).execute(*params)
  end

  def query(statement)
    @client.query(statement)
  end
end
