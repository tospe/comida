class CreateIngredientAtRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_at_recipes do |t|
      t.string :quantity
      t.belongs_to :ingredient
      t.belongs_to :recipe
      t.timestamps
    end
  end
end