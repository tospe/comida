class Ingredient < ApplicationRecord
	# Relationships
	has_many :ingredient_at_recipes
	has_many :recipes, through: :ingredient_at_recipes

end
