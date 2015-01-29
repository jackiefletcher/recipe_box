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

get("/recipes/:id") do
  @ingredients = Ingredient.all()
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe_info)
end

patch("/recipes/:id") do
  recipe_id = params.fetch("id").to_i()
  @recipe = Recipe.find(recipe_id)
  ingredient_ids = params.fetch("ingredient_ids") + @recipe.ingredient_ids
  @recipe.update({:ingredient_ids => ingredient_ids})
  @ingredients = Ingredient.all()
  erb(:recipe_info)
end

get("/ingredients/:id") do
  @recipes = Recipe.all()
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  erb(:ingredient_info)
end

patch("/ingredients/:id") do
  ingredient_id = params.fetch("id").to_i()
  @ingredient = Ingredient.find(ingredient_id)
  recipe_ids = params.fetch("recipe_ids")
  @ingredient.update({:recipe_ids => recipe_ids})
  @recipes = Recipe.all()
  erb(:ingredient_info)
end
