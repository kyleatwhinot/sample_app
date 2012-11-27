class TwilioController < ApplicationController

  def process_sms
    @city = params[:FromCity].capitalize
    @state = params[:FromState]
    @from = params[:From]
    u = User.find_by_phone_number(@from)
    @user = u.name
    b = params[:Body]

    if b.downcase.include?("ask")
    	@type = "Ask"
    	@ask = u.asks.build(:description => b)
    	@ask.save!
    	render 'new_ask.xml.erb', :content_type => 'text/xml'
    elsif b.downcase.include?("contact")
    	@type = "Contact"
    	@contact = u.contacts.build(:name => b)
    	@contact.save!
    	render 'new_contact.xml.erb', :content_type => 'text/xml'
    else
    	@type = "Not sure"
    	render 'not_sure.xml.erb', :content_type => 'text/xml'
    end

    
  end

end