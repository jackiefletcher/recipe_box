require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many (:ingredients) }
  it { should have_and_belong_to_many (:categories) }
  it("validate presence of name") do
    recipe = Recipe.new({:name => ''})
    expect(recipe.save()).to(eq(false))
  end

  it("will capitalize the name of the recipe") do
    recipe = Recipe.create({:name => "eggs benedict"})
    expect(recipe.name()).to(eq("Eggs benedict"))
  end

  it("will alphabetize the recipes") do
    recipe = Recipe.create({:name => "zucchini dip"})
    recipe1 = Recipe.create({:name => "artichoke dip"})
    expect(Recipe.alphabetical()).to(eq([recipe1, recipe]))
  end
end
