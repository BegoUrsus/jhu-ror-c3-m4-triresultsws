# solution/app/controllers/api/results_controller.rb
module Api
	class ResultsController < ApplicationController


	  # GET api/races/:race_id/results
	  # GET api/races/:race_id/results.json	  
	  def index
	  	if !request.accept || request.accept == "*/*"
				render plain: api_race_results_path, status: :ok
			else
				#real implementation ...
				@race=Race.find(params[:race_id])
				@entrants=@race.entrants
				fresh_when last_modified: @entrants.max(:updated_at)
				render action: :entrants

			end
	  end #index

	  # GET api/races/:race_id/results/1
	  # GET api/races/:race_id/results/1.json
	  def show
	  	if !request.accept || request.accept == "*/*"
				render plain: api_race_result_path(params[:race_id], params[:id]), status: :ok
			else
				#real implementation ...
				@result=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
				render :partial=>"result", :object=>@result
			end
	  end #show

	  # PATCH/PUT /api/races/:race_id/results/1
	  # PATCH/PUT /api/races/:race_id/results/1json
	  def update
	  	# 	Rails.logger.debug("method=#{request.method}")
	  	# 	request.method can be 'PATCH' or 'PUT'
	  	entrant = Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
			result = params[:result]

			if result
				if result[:swim]
					entrant.swim=entrant.race.race.swim
					entrant.swim_secs = result[:swim].to_f
				end
				if result[:t1]
					entrant.t1=entrant.race.race.t1
					entrant.t1_secs = result[:t1].to_f
				end
				if result[:bike]
					entrant.bike=entrant.race.race.bike
					entrant.bike_secs = result[:bike].to_f
				end
				if result[:t2]
					entrant.t2=entrant.race.race.t2
					entrant.t2_secs = result[:t2].to_f
				end
				if result[:run]
					entrant.run=entrant.race.race.run
					entrant.run_secs = result[:run].to_f
				end
				entrant.save
				render plain: :nothing, status: :ok
			end #result
	  end #update

	end #ResultsController
end #Api