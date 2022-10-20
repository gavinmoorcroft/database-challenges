# book_store Model and Repository Classes Design Recipe

## 1. Design and create the Table

[See here](recipes_directory_database_schema_recipe.md)

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (recipe_name, avergae_cook_time, rating) VALUES ('Shepherds Pie', '40','5');
INSERT INTO recipes (recipe_name, avergae_cook_time, rating) VALUES ('Pizza', '12','5');
INSERT INTO recipes (recipe_name, avergae_cook_time, rating) VALUES ('fish pie', '30','3');
INSERT INTO recipes (recipe_name, avergae_cook_time, rating) VALUES ('kippers', '5','1');
INSERT INTO recipes (recipe_name, avergae_cook_time, rating) VALUES ('pancakes', '5','5');
INSERT INTO recipes (recipe_name, avergae_cook_time, rating) VALUES ('roast chicken', '60','4');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)

# Repository class
# (in lib/student_repository.rb)

class RecipiesDirectory

end

class RecipiesDirectoryRepository

end

```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)

class RecipesDirectory

  # Replace the attributes by your own columns.
  attr_accessor :id, :recipe_name, :avergae_cook_time, :rating
end

```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class RecipesDirectoryRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, recipe_name, avergae_cook_time, rating FROM table_name;

    # Returns an array of all recipe objects.
  end

  def average_cook_time
    # Executes the SQL query:
    # SELECT id, recipe_name, rating FROM table_name WHERE average_cook_time =< bluh;

    # Returns an array of recipe objects.
  end

  def rating
    # Executes the SQL query:
    # SELECT id, recipe_name, rating FROM table_name WHERE rating => bluh;

    # Returns an array of recipe objects.
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
repo = RecipeDirectoyRepository.new

recipes = repo.all

# Test 1 - return all

recipes.length #=> 6

recipes[0].id #=> 1
recipes[0].recipe_name #=> 'shepherd's pie'
recipes[0].average_cook_time #=> '40'
recipes[0].rating #=> '5'

# Test 2 - find with average cook time 30mins

recipes[0].id #=> 2
recipes[0].recipe_name #=> 'pizza'
recipes[0].rating #=> '5'

recipes[1].id #=> 3
recipes[1].recipe_name #=> 'fish pie'
recipes[1].rating #=> '3'

recipes[2].id #=> 4
recipes[2].recipe_name #=> 'kippers'
recipes[2].rating #=> '1'

recipes[3].id #=> 5
recipes[3].recipe_name #=> 'pancakes'
recipes[3].rating #=> '5'

# Test 3 - find with rating 4 

recipes[0].id #=> 1
recipes[0].recipe_name #=> 'Shepherd's pie'
recipes[0].rating #=> '5'

recipes[1].id #=> 2
recipes[1].recipe_name #=> 'pizza'
recipes[1].rating #=> '5'

recipes[2].id #=> 2
recipes[2].recipe_name #=> 'pancakes'
recipes[2].rating #=> '5'

recipes[2].id #=> 2
recipes[2].recipe_name #=> 'roast chicken'
recipes[2].rating #=> '4'


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

    def reset_books_table
        seed_sql = File.read('spec/book_store_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        connection.exec(seed_sql)
    end5
      
    before(:each) do 
        reset_books_table
    end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._