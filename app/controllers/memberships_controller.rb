class MembershipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @group = Group.find(params[:relationship][:group_id])
    current_user.join!(@groupr)
    flash[:success] = "Membership created"
    #respond_to do |format|
    #  format.html { redirect_to @user }
    #  format.js
    #end
  end

  def destroy
    @group = Relationship.find(params[:group_id])
    current_user.leave!(@group)
    #respond_to do |format|
    #  format.html { redirect_to @user }
    #  format.js
    #end
  end

  def index
  end
end