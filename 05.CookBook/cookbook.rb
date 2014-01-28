require_relative 'config/application'
require './models/recipe'

# your program here

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. update or delete recipes"
puts "3. read your recipes"

choice = gets.chomp.to_i

if choice == 1
  puts "name?"
  name = gets.chomp
  puts "description?"
  description = gets.chomp
  puts "length?"
  length = gets.chomp.to_i
  puts "difficulty?"
  difficulty = gets.chomp.to_i

  new_recipe = Recipe.create(name: name, description: description, length: length, difficulty: difficulty)

elsif choice == 2
# your code here to delete all recipes
  puts "delete all recipes (1) or one recipe (2) or update(3)?"
  choice = gets.chomp.to_i
  if choice == 1
    recipes = Recipe.all
    recipes.delete.all
    puts "you just deleted all your recipes!"
  elsif choice == 2
    puts "what recipe?"
    id = gets.chomp
    receipe_to_destroy = Recipe.find_by(name: id)
    receipe_to_destroy.destroy

  elsif choice == 3
    puts "what recipe?"
    id = gets.chomp
    puts "new you description?"
    description = gets.chomp 
  end
  
elsif choice == 3
  puts Recipe.all

  
else
  puts "i did not understand"
  
end