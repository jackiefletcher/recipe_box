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
  erb(:recipe)
end
