class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.date :date
      t.references :recipe, null: false, foreign_key: true
      t.references :meal_plan, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
