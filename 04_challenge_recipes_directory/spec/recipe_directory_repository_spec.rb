require 'recipes_directory_repository'

RSpec.describe RecipesDirectoryRepository do
    
    def reset_recipes_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
        connection.exec(seed_sql)
    end
      
    before(:each) do 
        reset_recipes_table
    end

    it 'returns all six recipes' do
        repo = RecipesDirectoryRepository.new
        recipes = repo.all

        expect(recipes.length).to eq 6
    end

    it 'contains the correct data for the first item when returning all' do
        repo = RecipesDirectoryRepository.new
        recipes = repo.all

        expect(recipes[0].id).to eq "1"
        expect(recipes[0].recipe_name).to eq "Shepherds Pie"
        expect(recipes[0].average_cook_time).to eq '40'
        expect(recipes[0].rating).to eq '5'
    end

    it 'find recipes with a avergae cook time of 30 mins or less' do
    # Test 2 - find with average cook time 30mins
        repo = RecipesDirectoryRepository.new
        recipes = repo.find_cook_time(30)

        expect(recipes[0].id).to eq "2"
        expect(recipes[0].recipe_name).to eq 'Pizza'
        expect(recipes[0].rating).to eq '5'

        expect(recipes[1].id).to eq "3"
        expect(recipes[1].recipe_name).to eq 'fish pie'
        expect(recipes[1].rating).to eq '3'

        expect(recipes[2].id).to eq "4"
        expect(recipes[2].recipe_name).to eq 'kippers'
        expect(recipes[2].rating).to eq '1'

        expect(recipes[3].id).to eq "5"
        expect(recipes[3].recipe_name).to eq 'pancakes'
        expect(recipes[3].rating).to eq '5'
    end

    it 'find recipes with a rating of 4 or more' do
        repo = RecipesDirectoryRepository.new
        recipes = repo.find_rating(4)

        expect(recipes[0].id).to eq "1"
        expect(recipes[0].recipe_name).to eq "Shepherds Pie"
        expect(recipes[0].rating).to eq '5'
        
        expect(recipes[1].id).to eq "2"
        expect(recipes[1].recipe_name).to eq 'Pizza'
        expect(recipes[1].rating).to eq '5'
        
        expect(recipes[2].id).to eq "5"
        expect(recipes[2].recipe_name).to eq 'pancakes'
        expect(recipes[2].rating).to eq '5'
        
        expect(recipes[3].id).to eq "6"
        expect(recipes[3].recipe_name).to eq 'roast chicken'
        expect(recipes[3].rating).to eq '4'
    end




end