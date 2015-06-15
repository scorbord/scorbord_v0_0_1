class PeriodsController < ApplicationController
	respond_to :html, :js

	def index
		@periods = Period.rank(:row_order).all
	end

	def show
		@periods = Period.rank(:row_order).all
	end

	def update_row_order
		@period = Period.find(period_params[:period_id])
		@period.row_order_position = period_params[:row_order_position]
		@period.save

		render nothing: true
	end

	def edit
		@period = Period.find(params[:id])
	end

	def update
		@period = Period.find(params[:id])
		if @period.update_attributes(period_params)
			respond_to do |format|
				format.html { redirect_to practice_plan_path(@period.practice_plan_id) }
				format.js
			end
		end
	end

	def create
		@practice_plan = PracticePlan.find(params[:practice_plan])
		@period = @practice_plan.periods.new(period_params)
		respond_to do |format|
			if @period.save
				# do nothing
				#redirect_to practice_plan_path(@practice_plan)
				
					format.html { redirect_to @practice_plan }
					format.js 
				
			else
				flash.now[:danger] = "Period not created"
				# format.html { redirect_to @practice_plan }
				format.html { redirect_to @practice_plan} 
				format.json { render json: @period.errors, status: :unprocessable_entity } 
			end
		end
	end

	def destroy
		@practice_plan = Period.find(params[:id]).practice_plan_id
		Period.find(params[:id]).destroy
		#flash[:success] = "Period Deleted"
		respond_to do |format|
			format.html { redirect_to practice_plan_path(@practice_plan) }
			format.js
		end
	end


	private

		def set_period
			@period = Period.find(params[:id])
		end

		def period_params
			params.require(:period).permit(:period_id, :description, :duration, :practice_plan_id, :row_order_position)
		end
end
