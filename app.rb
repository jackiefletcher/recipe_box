require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @ingredients = Ingredient.all()
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipe)
end

post('/recipes') do
  name = params.fetch("name")
  instruction = params.fetch("instruction")
  Recipe.create({:name => name, :instruction => instruction})
  @recipes = Recipe.all()
  erb(:recipe)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredient)
end

post('/ingredients') do
  food = params.fetch('food')
  Ingredient.create({:food => food})
  @ingredients = Ingredient.all()
  erb(:ingredient)
end
