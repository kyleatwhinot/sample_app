class AsksController < ApplicationController

  def new
    @ask = current_user.asks.build(params[:ask])
    @ask.save!
  end

  def new
    @ask = current_user.asks.build(params[:ask])
    @ask.save!
  end

  def edit
    @ask = current_user.asks.find(params[:id])
    next_step = @ask.check_change(params[:ask])
    if next_step == "ask2"
      @ask.update_attributes!(params[:ask])
      ask2
      flash[:notice] = "Description added"
    elsif next_step == "ask3"
      @ask.update_attributes!(params[:ask])
      ask3
      flash[:notice] = "Helper and public added"
    elsif next_step == "ask4"
      @ask.update_attributes!(params[:ask])
      ask4
      flash[:notice] = "Category added"
    else
      @ask.update_attributes!(params[:ask])
      flash[:notice] = "Not sure what to do"
    end
  end

  def update
    @ask = current_user.asks.find(params[:id])
    next_step = @ask.check_change(params[:ask])
    if next_step == "ask2"
      @ask.update_attributes!(params[:ask])
      ask2
      flash[:notice] = "Description added"
    elsif next_step == "ask3"
      @ask.update_attributes!(params[:ask])
      ask3
      flash[:notice] = "Helper and public added"
    elsif next_step == "ask4"
      @ask.update_attributes!(params[:ask])
      ask4
      flash[:notice] = "Category added"
    else
      @ask.update_attributes!(params[:ask])
      flash[:notice] = "Not sure what to do"
    end
  end

  def ask2
    respond_to do |format|
      format.html { redirect_to edit_ask_path(@ask) }
      format.js
    end
  end

  def ask3
    respond_to do |format|
      format.html { redirect_to edit_ask_path(@ask) }
      format.js
    end
  end

  def ask4
    respond_to do |format|
      format.html { redirect_to edit_ask_path(@ask) }
      format.js
    end
  end

end
