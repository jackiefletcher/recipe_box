class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:food, {:presence => true})
  before_save(:capitalize_food)

  private
  define_method(:capitalize_food) do
    self.food=(food().capitalize())
  end
end
