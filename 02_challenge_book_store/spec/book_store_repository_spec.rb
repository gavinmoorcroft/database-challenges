
require 'book_store_repository'

RSpec.describe BookStoreRepository do
    
    def reset_books_table
        seed_sql = File.read('spec/book_store_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        connection.exec(seed_sql)
    end
      
    before(:each) do 
        reset_books_table
    end
    

    it 'returns all five of the records' do 
        repo = BookStoreRepository.new
        books = repo.all
        expect(books.length).to eq 5
    end     




    it 'returns the correct data for the first book' do
        repo = BookStoreRepository.new
        books = repo.all

        expect(books[0].id).to eq "1"
        expect(books[0].title).to eq 'Mrs Dalloway'
        expect(books[0].author_name).to eq 'Virginia Woolf'
    end

    it 'returns the correct data for the second book' do
        repo = BookStoreRepository.new
        books = repo.all
        
        expect(books[1].id).to eq "2"
        expect(books[1].title).to eq 'Emma'
        expect(books[1].author_name).to eq 'Jane Austen'
    end

    it 'returns the correct data for the third book' do
        repo = BookStoreRepository.new
        books = repo.all
        
        expect(books[2].id).to eq '3'
        expect(books[2].title).to eq 'Dracula'
        expect(books[2].author_name).to eq 'Bram Stoker'
    end

    it 'returns the correct data for the forth book' do
        repo = BookStoreRepository.new
        books = repo.all
        
        expect(books[3].id).to eq "4"
        expect(books[3].title).to eq 'The Age of Innocence'
        expect(books[3].author_name).to eq 'Edith Wharton'
    end

    it 'returns the correct data for the fifth book' do
        repo = BookStoreRepository.new
        books = repo.all
        
        expect(books[4].id).to eq '5'
        expect(books[4].title).to eq 'Nineteen Eighty-Four'
        expect(books[4].author_name).to eq 'George Orwell'
    end
end