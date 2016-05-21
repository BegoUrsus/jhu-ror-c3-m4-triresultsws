# solution/app/controllers/api/races_controller.rb
module Api
	class RacesController < ApplicationController

		before_action :set_race, only: [:show, :edit, :update, :destroy]

    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      @msg = "woops: cannot find race[#{params[:id]}]"
      if !request.accept || request.accept == "*/*"
        render plain: @msg, status: :not_found
      else
        render action: :error, status: :not_found
      end
    end

    rescue_from ActionView::MissingTemplate do |exception|
			Rails.logger.debug exception
      @msg = "woops: we do not support that content-type[#{request.accept}]"
      render plain: @msg, status: 415
		end


	  # GET /api/races
	  # GET /api/races.json
	  def index
			if !request.accept || request.accept == "*/*"
   			render plain: "#{api_races_path}, offset=[#{params[:offset]}], limit=[#{params[:limit]}]", status: :ok
			else
				#real implementation   			
  		end
	  end

	  # GET /api/races/1
	  # GET /api/races/1.json
	  def show
			if !request.accept || request.accept == "*/*"
   			render plain: api_race_path(params[:id]), status: :ok
			else
      	@race = Race.find(params[:id])
				render :race, status: :ok
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
          render json: @race.errors
				end
			end
		end

	  # PATCH/PUT /api/races/1
	  # PATCH/PUT /api/races/1.json
	  def update
	  	# 	Rails.logger.debug("method=#{request.method}")
	  	# 	request.method can be 'PATCH' or 'PUT'
     	@race = Race.find(params[:id])
			if @race.update(race_params)
				render json: @race, status: :ok
			else
        render json: @race.errors
			end	  	
	  end

	  # DELETE /api/races/1
	  # DELETE /api/races/1.json
	  def destroy
     	@race = Race.find(params[:id])
	  	@race.destroy
	  	render :nothing=>true, :status => :no_content
	  end


	  private
			# Use callbacks to share common setup or constraints between actions.
    	def set_race
#	     	@race = Race.find(params[:id])
    	end

      # Never trust parameters from the scary internet, only allow the white list through.
	    def race_params
	      params.require(:race).permit(:name, :date)
	    end

	end
end