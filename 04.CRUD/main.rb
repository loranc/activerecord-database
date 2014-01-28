require 'sqlite3'

# creates the database
db_path = "db/cookbook.sqlite"
db = SQLite3::Database.new(db_path)

# creates the schema of the database
# your code here
sql = %q{ CREATE TABLE IF NOT EXISTS Recipe(
    id INTEGER primary key autoincrement,
    name VARCHAR(255),
    description VARCHAR(255),
    length INTEGER,
    difficulty INTEGER
    )
}
db.execute(sql)

# IF NOT EXITS : permet de ne pas ecraser la table si elle existe deja
#NB : l'expression %q{} permet de réaliser une interpolation de sting sur plusieurs lignes


#*************************************

# function to create a recipe
def create_recipe(db,name,description,length,difficulty)
  db.execute("INSERT INTO Recipe (name, description, length, difficulty) VALUES ('#{name}','#{description}', #{length}, #{difficulty})")
end
#ne pas oublier les '' autour des strings sinon c'est mal interprété


# function to delete a recipe
def delete_recipe(db,id)
 db.execute("DELETE FROM Recipe 
 WHERE name='#{id}'
  ")
end

# function to delete all recipes
def delete_all_recipes(db)
   db.execute("DELETE FROM recipe;")
end

# function to update a recipe
def update_recipe(db,id,description)
  db.execute("UPDATE Recipe 
    SET description='#{description}'
    WHERE name='#{id}'
    ")

end

def get_recipes(db)
  db.execute("SELECT name FROM Recipe")
end


#*************************************

# program

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. delete or update recipes"
puts "3. read your recipes"

choice =  gets.chomp.to_i

if choice == 1
  puts "name?"
  name = gets.chomp
  puts "description?"
  description = gets.chomp
  puts "length?"
  length = gets.chomp.to_i
  puts "difficulty?"
  difficulty = gets.chomp.to_i

  create_recipe(db,name,description,length,difficulty)

  # your code here to create a recipe
  # you need to ask for name, description, length and difficulty
elsif choice == 2
# your code here to delete all recipes
  puts "delete all recipes (1) or one recipe (2) or update(3)?"
  choice = gets.chomp.to_i
  if choice == 1
    delete_all_recipes(db)
    puts "you just deleted all your recipes!"
  elsif choice == 2
    puts "what recipe?"
    id = gets.chomp
    delete_recipe(db,id)
  elsif choice == 3
    puts "what recipe?"
    id = gets.chomp
    puts "new you description?"
    description = gets.chomp
    update_recipe(db,id,description)
  end

elsif choice == 3
  get_recipes(db)
  # your code here to read all recipes
end 

  
  
  
  