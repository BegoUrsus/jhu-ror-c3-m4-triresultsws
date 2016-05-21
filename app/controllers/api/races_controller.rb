# solution/app/controllers/api/races_controller.rb
module Api
	class RacesController < ApplicationController

	  # GET /api/races
	  # GET /api/races.json
	  def index
			if !request.accept || request.accept == "*/*"
   			render plain: "#{api_races_path}, offset=[#{params[:offset]}], limit=[#{params[:limit]}]", status: :ok
			else
				#real implementation ...
			end
	  end

	  # GET /api/races/1
	  # GET /api/races/1.json
	  def show
			if !request.accept || request.accept == "*/*"
   			render plain: api_race_path(params[:id]), status: :ok
			else
				#real implementation ...
			end
	  end

	  # POST /api/races
	  # POST /api/races.json
	  def create
			if !request.accept || request.accept == "*/*"
				render plain: "#{params[:race][:name]}", status: :ok
			else
				#real implementation
				@race = Race.new(race_params);
				if @race.save
					render plain: race_params[:name], status: :created
				else
					render plain: "couldn't save"
				end
			end
		end

	  # PATCH/PUT /api/races/1
	  # PATCH/PUT /api/races/1.json
	  def update
	  end

	  # DELETE /api/races/1
	  # DELETE /api/races/1.json
	  def destroy
	  end


	  private
      # Never trust parameters from the scary internet, only allow the white list through.
	    def race_params
	      params.require(:race).permit(:name, :date)
	    end

	end
end