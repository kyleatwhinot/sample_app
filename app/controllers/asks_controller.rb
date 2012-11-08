class AsksController < ApplicationController

  def new
    @ask = current_user.asks.build(params[:ask])
    @ask.save
    flash[:success] = "ask new"
  end

  def create
	@ask = current_user.asks.build(params[:ask])
	@ask.save
	flash[:success] = "ask created"
	redirect_to edit_ask_path(@ask)
  end

  def edit
  	@ask = current_user.asks.find(params[:id])
  	@ask.update_attributes(params[:ask])
	if @ask.save
		flash[:success] = "ask edited"
	end
  end

  def update
  	@ask = current_user.asks.find(params[:id])
  	if @ask.update_attributes(params[:ask])
  		flash[:success] = "ask updated!"
  		redirect_to edit_ask_path(@ask)
  	else
  		flash[:error] = "something is wrong with the ask update"
  		redirect_to edit_ask_path(@ask)
  	end
  end

  def update_category(category)
  	@ask = current_user.asks.find(params[:id])
  	@ask.update_attributes(params[:category])
  end

end
