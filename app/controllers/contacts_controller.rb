class ContactsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @contact = current_user.contacts.build(params[:contact])
    @contact.save
    flash[:success] = "Contact added..."
    redirect_to root_path
  end

  def update
    @contact = current_user.contacts.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:success] = "Contact updated..."
      redirect_to root_path
    else
      flash[:error] = "Something is wrong with the update"
      redirect_to root_path
    end
  end

  def index

  end

end