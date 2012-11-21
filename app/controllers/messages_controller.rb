class MessagesController < ApplicationController

  def new
  	@ask = Ask.find(params[:ask_id])
  	@message = @ask.messages.build
  end

  def create
	@ask = Ask.find(params[:ask_id])
	@message = @ask.messages.build(params[:message])
	@message.save
	
	if @message.valid?
		HelpOthersMailer.i_can_help(current_user, @ask, @message, @ask.user).deliver
		redirect_to root_path
		flash[:notice] = "Message sent successfully."
	else
		flash[:error] = "Sorry, something fishy is going on. Did you fill in all the fields?"
		render :new
	end
  end
end