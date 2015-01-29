class CreateTablesRecipesIngredients < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instruction, :string)
      t.timestamps
    end

    create_table(:ingredients) do |t|
      t.column(:food, :string)
      t.timestamps
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
    end
  end
end
