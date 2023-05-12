require 'mysql2'


client = Mysql2::Client.new(
  host: 'localhost',
  username: 'root',
  password: '12345',
  database: 'student_db'
)

results = client.query('SELECT * FROM student')
results.each do |row|
  puts row.inspect
end
