# solution/app/controllers/api/races_controller.rb
module Api
	class RacesController < ApplicationController

	  # GET /api/races
	  # GET /api/races.json
	  def index
			if !request.accept || request.accept == "*/*"
   			render plain: api_races_path
			else
				#real implementation ...
			end
	  end

	  # GET /api/races/1
	  # GET /api/races/1.json
	  def show
			if !request.accept || request.accept == "*/*"
   			render plain: api_race_path(params[:id])
			else
				#real implementation ...
			end
	  end

	end
end