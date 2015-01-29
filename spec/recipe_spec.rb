require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many (:ingredients) }
  it("validate presence of name") do
    recipe = Recipe.new({:name => ''})
    expect(recipe.save()).to(eq(false))
  end
end
