class Admin::SchedulesController < ApplicationController

	layout 'private'
	def index
  	end
	def new
		@schedules=Schedule.all
		@schedule=Schedule.new
	end
	

	def show
    	@schedule = Schedule.find(params[:id])
    end
	
	def create
	@schedules=Schedule.all
  	@schedule = Schedule.new(permit_params)

	  	if @schedule.save
	  		redirect_to new_admin_schedule_path
	  	else
	  		render 'new'
	  	end
    end
    
    def edit
      @schedule = Schedule.find(params[:id])
    end
	
		def destroy
	  @schedule = Schedule.find(params[:id])
	  @schedule.destroy
	  redirect_to admin_path
    end
    
    def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(permit_params)
      redirect_to new_admin_schedule_path
    else
      render 'edit'
    end
  end

    private

	def permit_params
  		params.require(:schedule).permit(:hour)
 	end

end







