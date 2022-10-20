# Single Table Design Recipe Template
## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).

```

```
Nouns: recipes, recipe name, average cooking time, rating

```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Table name            | column names                         |
| --------------------- | -----------------------------------  |
| recipes               |  recipe_name, average_cook_time, rating|

Name of the table (always plural): `recipes`

Column names: `recipe_name, average_cook_time, rating`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

id: SERIAL,
recipe_name: text,
average_cook_time: int,
rating: int;

```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  recipe_name: text,
  average_cook_time: int,
  rating: int;
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 database_name < seed_file_name.sql
```
