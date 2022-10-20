require_relative 'lib/database_connection'
require_relative 'lib/recipes_directory_repository'

DatabaseConnection.connect('recipes_directory')

recipe_directory = RecipesDirectoryRepository.new

repo_all = recipe_directory.all

repo_all.each do |recipe|
   
   # p recipe.recipe_name
   
end

repo_find_cook_time = recipe_directory.find_cook_time(30)

repo_find_cook_time.each do |recipe|
   
    recipe_name = recipe.recipe_name
    cook_time = recipe.average_cook_time
    
    p "#{recipe_name} has a cooking time of #{cook_time} mins"
end

repo_find_rating = recipe_directory.find_rating(4)

repo_find_rating.each do |recipe|
   
    recipe_name = recipe.recipe_name
    rating = recipe.rating
    
    p "#{recipe_name} has a cooking time of #{rating} out of 5"
end