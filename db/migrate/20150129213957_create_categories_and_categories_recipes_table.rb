class CreateCategoriesAndCategoriesRecipesTable < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:description, :string)
      t.timestamps
    end

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)
      t.timestamps
    end

  end
end
