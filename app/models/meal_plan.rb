class MealPlan < ApplicationRecord
	has_many :meals, dependent: :destroy
	accepts_nested_attributes_for :meals, allow_destroy: true

	def build_meals
		recipe_ids = Recipe.all.pluck(:id)

		(start_date..end_date).each do |date|
			meals.build(date: date, recipe_id: recipe_ids.sample, category: 'lunch')
			meals.build(date: date, recipe_id: recipe_ids.sample, category: 'dinner')
		end
	end
end
  