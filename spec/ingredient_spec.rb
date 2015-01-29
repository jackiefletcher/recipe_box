require('spec_helper')

describe(Ingredient) do
  it { should have_and_belong_to_many (:recipes) }
  it("validates presence of food") do
    ingredient = Ingredient.new({:food => ''})
    expect(ingredient.save()).to(eq(false))
  end
end
