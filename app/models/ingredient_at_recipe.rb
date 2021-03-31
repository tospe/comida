class IngredientAtRecipe < ApplicationRecord
	belongs_to :ingredient
	belongs_to :recipe

	accepts_nested_attributes_for :ingredient, allow_destroy: true
end
