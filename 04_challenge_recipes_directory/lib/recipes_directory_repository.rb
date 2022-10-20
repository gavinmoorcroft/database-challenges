require_relative './recipes_directory'

class RecipesDirectoryRepository

    def all
        recipes = []
          
        sql = 'SELECT id, recipe_name, average_cook_time, rating FROM recipes;'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |recipe|
            recipe_directory = RecipesDirectory.new
            recipe_directory.id = recipe['id']
            recipe_directory.recipe_name = recipe['recipe_name']
            recipe_directory.average_cook_time = recipe['average_cook_time']
            recipe_directory.rating = recipe['rating']

            recipes << recipe_directory
        end

        return recipes
    end

    def find_cook_time (value)
        params = [value]
        recipes = []

        sql = 'SELECT id, recipe_name, average_cook_time, rating FROM recipes WHERE average_cook_time <= $1;'
        result = DatabaseConnection.exec_params(sql, params)

        result.each do |recipe|
            recipe_directory = RecipesDirectory.new
            recipe_directory.id = recipe['id']
            recipe_directory.recipe_name = recipe['recipe_name']
            recipe_directory.average_cook_time = recipe['average_cook_time']
            recipe_directory.rating = recipe['rating']

            recipes << recipe_directory
        end

        return recipes
    end

    def find_rating (value)
        params = [value]
        recipes = []
    
        sql = 'SELECT id, recipe_name, average_cook_time, rating FROM recipes WHERE rating >=  $1;'
        result = DatabaseConnection.exec_params(sql, params)

        result.each do |recipe|
            recipe_directory = RecipesDirectory.new
            recipe_directory.id = recipe['id']
            recipe_directory.recipe_name = recipe['recipe_name']
            recipe_directory.average_cook_time = recipe['average_cook_time']
            recipe_directory.rating = recipe['rating']

            recipes << recipe_directory

        end
        return recipes

    end
end