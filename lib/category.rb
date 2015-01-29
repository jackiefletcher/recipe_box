class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:description, {:presence => true})
  before_save(:capitalize_description)
  scope(:alphabetical, -> { order(:description) })

private
  define_method(:capitalize_description) do
    self.description=(description().capitalize())
  end
end
