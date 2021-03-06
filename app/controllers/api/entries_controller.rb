# solution/app/controllers/api/entries_controller.rb
module Api
	class EntriesController < ApplicationController

	  # GET api/racers/:racer_id/entries
	  # GET api/racers/:racer_id/entries.json
	  def index
				render plain: api_racer_entries_path, status: :ok
	  end

	  # GET api/racers/:racer_id/entries/1
	  # GET api/racers/:racer_id/entries/1.json
	  def show
	  	if !request.accept || request.accept == "*/*"
				render plain: api_racer_entry_path(params[:racer_id], params[:id]), status: :ok
			else
				#real implementation ...
			end
	  end

	end
end