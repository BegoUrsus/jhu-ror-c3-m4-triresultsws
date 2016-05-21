# solution/app/controllers/api/racers_controller.rb
module Api
	class RacersController < ApplicationController

	  # GET /api/racers
	  # GET /api/racers.json
	  def index
			if !request.accept || request.accept == "*/*"
				render plain: api_racers_path, status: :ok
			else
				#real implementation ...
			end
	  end

	  # GET /api/racers/1
	  # GET /api/racers/1.json
	  def show
			if !request.accept || request.accept == "*/*"
   			render plain: api_racer_path(params[:id]), status: :ok
			else
				#real implementation ...
			end
	  end

  end #class RacersController
end #module Api
