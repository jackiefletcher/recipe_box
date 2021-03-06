require('spec_helper')

describe(Ingredient) do
  it { should have_and_belong_to_many (:recipes) }
  it("validates presence of food") do
    ingredient = Ingredient.new({:food => ''})
    expect(ingredient.save()).to(eq(false))
  end

  it("will capitalize the name of the ingredient") do
    ingredient = Ingredient.create({:food => "eggs"})
    expect(ingredient.food()).to(eq("Eggs"))
  end

  it("will alphabetize the ingredients list") do
    ingredient1 = Ingredient.create({:food => "eggs"})
    ingredient2 = Ingredient.create({:food => "apple"})
    expect(Ingredient.alphabetical()).to(eq([ingredient2, ingredient1]))
  end
end
