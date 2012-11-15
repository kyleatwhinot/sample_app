class AsksController < ApplicationController
before_filter :check_params

  def check_params
    if params[:category] != nil
      update_category
    end
  end

  def new
    @ask = current_user.asks.build(params[:ask])
    @ask.save
    flash[:success] = "ask new"
  end

  def create
  	@ask = current_user.asks.build(params[:ask])
  	@ask.save
  	flash[:success] = "ask created"
  	respond_to do |format|
      format.html { redirect_to edit_ask_path(@ask) }
      format.js
    end
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
      respond_to do |format|
        format.html { redirect_to edit_ask_path(@ask) }
        format.js
      end
  	else
  		flash[:error] = "something is wrong with the ask update"
  		redirect_to root_path
  	end
  end

  def update_category
    @ask = current_user.asks.find(params[:id])
    if @ask.update_attributes(params[:ask])
      flash[:success] = "Category updated!"
      respond_to do |format|
        format.html { redirect_to edit_ask_path(@ask) }
        format.js
      end
    else
      flash[:error] = "something is wrong with the ask update"
      redirect_to root_path
    end
  end

  def update_category(category)
  	@ask = current_user.asks.find(params[:id])
  	@ask.update_attributes(params[:category])
  end

end
