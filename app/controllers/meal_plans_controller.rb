class MealPlansController < ApplicationController

	def all
		@meal_plans = MealPlan.all.order("start_date desc")
	end
	def edit
		@meal_plan = MealPlan.find(params[:id])
	end

	def index
		@meal_plan = MealPlan.where("start_date <= ? AND end_date >= ?", Date.today, Date.today).first
	end 
	def new
		# logger.debug "New article: #{params["meal_plan"][:start_date]} -> #{params["meal_plan"][:start_date]}"
		@meal_plan = MealPlan.new( 
			start_date: params["meal_plan"].present? ? params["meal_plan"][:start_date] : Date.today,
			end_date: params["meal_plan"].present? ? params["meal_plan"][:end_date] : 6.days.from_now.to_date
		)
		@meal_plan.build_meals
	end

	def create
		@meal_plan = MealPlan.new(meal_plan_params)

		if @meal_plan.save
			redirect_to meal_plan_path(@meal_plan), notice: "Meal plan created!"
		else
			@errors = @meal_plan.errors.full_messages
			render :new
		end
	end

	def update
		@meal_plan = MealPlan.find(params[:id])
		if @meal_plan.update(meal_plan_params)
			redirect_to @meal_plan
		else
			render :edit
		end
	end  


	def show
		@meal_plan = MealPlan.find(params[:id])
	end	
	def destroy
		@meal_plan = MealPlan.find(params[:id])
		@meal_plan.destroy
		redirect_to meal_plans_path, notice: "Meal plan deleted!"
	end 	


	private
	def meal_plan_params
		params.require(:meal_plan).permit(
			:start_date,
			:end_date,
			meals_attributes: [
				:id,
				:date,
				:recipe_id
			]
		)
	end	

end