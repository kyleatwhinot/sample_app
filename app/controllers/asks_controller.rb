class AsksController < ApplicationController

  def new
    @ask = current_user.asks.build(params[:ask])
  end

  def create
    @ask = current_user.asks.build(params[:ask])
    if @ask.save!
      respond_to do |format|
        format.html { redirect_to edit_ask_path(@ask) }
        format.js
      end
    else
      flash[:error] = "Something is wrong. The Ask was not saved..."
    end
  end

  def edit
    @ask = current_user.asks.find(params[:id])
  end

  def update
    @ask = current_user.asks.find(params[:id])
    @ask.update_attributes(params[:ask])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
