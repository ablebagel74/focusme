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

	def addonetocounter()

		return unless request.xhr?
	  	return unless request.post?

		#add 1 to counter for activity count
		@activity = Activity.find_by_task(params[:activity])

		#read current value for activity
		oldtimes = @activity.times
		#add one to counter and update
		@activity.times = oldtimes +1

		@activity.save

		render :nothing => true

	end

	def resetcounters()

		#Get counter 
		@activities = Activity.all

		#Set all activities
		for activity in @activities do 
			activity.times = 0

			activity.save

		end	

		render :action => :index

	end

	def resetactivities()

		Activity.delete_all

		render :action => :index

	end

	def results
		@activities = Activity.all


	end


end
