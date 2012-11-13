class ContactsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @contact = current_user.contacts.build(params[:contact])
    @contact.save
    flash[:success] = "contact added"
    reminder("15404211659", "#{@contact.name} was added to your list of contacts.")
    redirect_to root_path
  end

  def update
    @contact = current_user.contacts.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:success] = "Marked done!"
      redirect_to root_path
    else
      flash[:error] = "Something is wrong with the update"
      redirect_to root_path
    end
  end

  def index

  end

end