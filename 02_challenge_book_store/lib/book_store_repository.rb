require_relative './book_store'

class BookStoreRepository

    def all
      books = []

      sql = 'SELECT id, title, author_name FROM books;'
      results = DatabaseConnection.exec_params(sql, [])

      results.each do |book|
        book_store = BookStore.new
        book_store.id = book['id']
        book_store.title = book['title']
        book_store.author_name = book['author_name']

        books << book_store

      end

      return books
      
    end
    
end