# solution/app/controllers/api/racers_controller.rb
module Api
	class RacersController < ApplicationController
	
#	  before_action :set_race, only: [:show, :edit, :update, :destroy]

	  # GET /api/racers
	  # GET /api/racers.json
	  def index
			if !request.accept || request.accept == "*/*"
				render plain: api_racers_path
			else
				#real implementation ...
			end
	  end

	  # GET /api/racers/1
	  # GET /api/racers/1.json
	  def show
			if !request.accept || request.accept == "*/*"
   			render plain: api_racer_path(params[:id])
			else
				#real implementation ...
			end
	  end

	end
end