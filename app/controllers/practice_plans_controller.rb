class PracticePlansController < ApplicationController
	before_action :require_user 
	before_action :current_user

	def index
		@user = current_user
		@practice_plans = @user.practice_plans.where('date >= ?', Date.today)

		@past_plans = @user.practice_plans.where('date < ?', Date.today).limit(3).reverse_order
	end

	def create
		@practice_plan = current_user.practice_plans.build(practice_plan_params)
		if @practice_plan.save
			flash[:success] = "Practice Plan Created"
			redirect_to practice_plan_path(@practice_plan)
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

	def new
		@practice_plan = current_user.practice_plans.new
	end

	def show
		@practice_plan = current_user.practice_plans.find_by(id: params[:id])
		#@practice_plan = PracticePlan.find_by(id: params[:id])
		if @practice_plan
			@periods = @practice_plan.periods.rank(:row_order).all
			@period = @practice_plan.periods.new
		end 

		
	end

	def history
		@user = current_user
		@practice_plans = @user.practice_plans.where('date < ?', Date.today).reverse_order
	end

	def edit
		#@practice_plan = current_user.practice_plan.find(params[:id])
		@practice_plan = PracticePlan.find(params[:id])
	end

	def update
		@practice_plan = PracticePlan.find(params[:id])
		if @practice_plan.update_attributes(practice_plan_params)
			respond_to do |format|
				format.html { redirect_to practice_plan_path }
				format.js
			end
		end
	end

	def destroy
		PracticePlan.find(params[:id]).destroy
		flash[:success] = "Practice Plan Deleted"
		respond_to do |format|
			format.html { redirect_to practice_plans_path }
			format.js
		end
	end


	private

		def practice_plan_params
			params.require(:practice_plan).permit(:description, :date, :start_time, :user_id)
		end

end
