class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :instructions, presence: true, length: { minimum: 10 }

  # Relationships
	has_many :ingredient_at_recipes, dependent: :destroy
	has_many :ingredients, through: :ingredient_at_recipes
  has_many :planner

  accepts_nested_attributes_for :ingredient_at_recipes, allow_destroy: true
  
end
