require('spec_helper')

describe(Category) do
  it { should have_and_belong_to_many (:recipes) }
  it("validates presence of description") do
    category = Category.new({:description => ''})
    expect(category.save()).to(eq(false))
  end

  it("will capitalize the name of the category") do
    category = Category.create({:description => "dinner"})
    expect(category.description()).to(eq("Dinner"))
  end

  it("will alphabetize the categorys list") do
    category1 = Category.create({:description => "dinner"})
    category2 = Category.create({:description => "appetizers"})
    expect(Category.alphabetical()).to(eq([category2, category1]))
  end
end
