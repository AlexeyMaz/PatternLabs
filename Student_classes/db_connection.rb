require 'mysql2'

class DBConnection
  require 'singleton'
  include Singleton

  def initialize
    db_config = {
      host: 'localhost',
      username: 'root',
      password: '12345',
      database: 'student_db'
    }
    @client = Mysql2::Client.new(db_config)
  end

  def query(sql)
    @client.query(sql)
  end

  def prepare(sql)
    @client.prepare(sql)
  end

  def last_id
    @client.last_id
  end
end
