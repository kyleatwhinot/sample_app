class OutcomesController < ApplicationController

	def new
		a = Ask.find_by_id(params[:ask_id])
		@ask_outcome = a.outcomes.build(params[:outcome])
	end

	def create
		a = Ask.find_by_id(params[:ask_id])
		@ask_outcome = a.outcomes.build(params[:outcome])
		if @ask_outcome.save
			flash[:success] = "Outcome saved!"
	      respond_to do |format|
	        format.html { redirect_to root_path }
	        format.js
	      end
	    else
	      flash[:error] = "Something is wrong. The outcome was not saved."
	    end
	end
end