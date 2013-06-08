class ActivitiesController < ApplicationController

  	def index
        @activities = Activity.all(:order => "created_at desc")
  	end

	def new
		@activity = Activity.new
	end

	def manage
		@activity = Activity.new

        @activities = Activity.all(:order => "created_at desc")
  	end

	def create

		@activity = Activity.new(:task => params[:activity], :times =>0)

		if @activity.valid? and @activity.save
			redirect_to activities_path
		else
			render :action => :manage
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

		if @activities !=nil then

			#Set all activities
			for activity in @activities do 
				activity.times = 0

				activity.save

			end

		end	

		render :action => :index

	end

	def resetactivities()

		Activity.delete_all

		render :action => :index

	end

	def results
		@activities = Activity.all

		actcounts = []
		actlabels = []
			for activity in @activities
  			actcounts << activity.times
  			actlabels << activity.task
		end

		@Chart = Gchart.pie_3d(:labels => actlabels, :data => actcounts, :size => '400x200')

	end
	
	def destroy

		put :id
		
    	@activity = Activity.find(params[:id])
    	@activity.delete

    	render :action => :manage

    end	

end
