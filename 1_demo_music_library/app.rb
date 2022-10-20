require_relative 'lib/database_connection'

DatabaseConnection.connect('music_library_test')

sql = 'SELECT id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end