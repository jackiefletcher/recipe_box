class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:name, {:presence => true})
  before_save(:capitalize_name)
  scope(:alphabetical, -> { order(:name) })

private
  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
