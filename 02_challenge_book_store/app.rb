require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store_test')

sql = 'SELECT * FROM books;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
int = 1
result.each do |book|
    title =  book["title"]
    author = book["author_name"]
    p title
    
    p "#{int} - #{title} - #{author}"

    int += 1
end