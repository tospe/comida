class RecipesController < ApplicationController
	layout "sidebar"
	def index
		@recipes = Recipe.all
	end

	def show 
		@recipe = Recipe.find(params[:id])

	end

	def new
		@recipe = Recipe.new
		@recipe.ingredient_at_recipes.build.build_ingredient
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render :edit
		end
	end  

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to :recipes
	end  

	private
	def recipe_params
		params.require(:recipe).permit(:title, :instructions, ingredient_at_recipes_attributes: [:id,:unit, :quantity, :recipe_id, :ingredient_id, :_destroy ])
	end  
end