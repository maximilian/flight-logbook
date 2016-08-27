class LogbooksController < ApplicationController

  def new
  	@Logbook = Logbook.new

  end

  def index
  	@Logbook = Logbook.all
    @Log_grid = initialize_grid(Logbook);
  end

  def create
  	#Submitting logbook entry form
  	@Logbook = Logbook.new(permit_logbook)

  	if @Logbook.save
  		flash[:success] = "Log successfully added!"
  		redirect_to logbooks_path
  	else
  		flash[:error] = @Logbook.errors.full_messages
  		redirect_to new_logbook_path

  	end
  end

  def destroy
    @Logbook = Logbook.find(params[:id])
    
    if @Logbook.destroy
    	flash[:success] = "Log successfully deleted"
		redirect_to logbooks_path
	else
		flash[:error] = "Log could not be deleted"
		redirect_to new_logbooks_path

	end
  end
  private
  	def permit_logbook
  		params.require(:logbook).permit(:date, :departurePlace, :departureTime, :arrivalPlace,
       :arrivalTime, :aircraftType, :aircraftReg, :multipilot_time, :flightTime, :PIC, :day_takeoff,
       :night_takeoff, :day_landing, :night_landing, :night_time, :ifr_time, :pic_time, :copilot_time,
       :dual_time, :instructor_time, :sim_date, :simtype, :sim_time, :remarks)
  	end
end