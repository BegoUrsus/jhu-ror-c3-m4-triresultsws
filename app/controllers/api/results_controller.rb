# solution/app/controllers/api/results_controller.rb
module Api
	class ResultsController < ApplicationController

	  # GET api/races/:race_id/results
	  # GET api/races/:race_id/results.json	  
	  def index
	  	if !request.accept || request.accept == "*/*"
				render plain: api_race_results_path
			else
				#real implementation ...
			end
	  end

	  # GET api/races/:race_id/results/1
	  # GET api/races/:race_id/results/1.json
	  def show
	  	if !request.accept || request.accept == "*/*"
				render plain: api_race_result_path(params[:race_id], params[:id])
			else
				#real implementation ...
			end
	  end

	end
end