class ActivitiesController < ApplicationController

  	def index
        @activities = Activity.all(:order => "created_at desc")
  	end

	def new
		@activity = Activity.new
	end

	def create

		@activity = Activity.new(params[:activity])

		if @activity.valid? and @activity.save
			redirect_to activities_path
		else
			render :action => :new
		end
	end

	def addonetocounter
	#add 1 to counter for activity count

	#read current value for activity

	#add one to counter and update


	end

	def results
		@activities = Activity.all


	end


end
