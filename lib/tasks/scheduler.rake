desc "This task is called by the Heroku scheduler add-on"
require 'twilio-ruby'

task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end

task :send_contacts_reminder_text_ET => :environment do
  puts "starting contact reminder task"
  
    account_sid = "AC3296e56896e36ea0b008cc879faf590c"
    auth_token = "59ebdbd467d8b29eb3b4416ed8491523"
    client = Twilio::REST::Client.new account_sid, auth_token
     
    from = "+18043136331" # Your Twilio number
    users = User.where("timezone IS ?", -5).where("text_alerts IS ?", true)
    users.to_a

    users.each do |u|
    	@rcn = []
    	puts u.name
      
	    u.contacts.where("done IS ?", false).order("created_at").limit(3).each do |rc|
	    	puts rc.name
	    	@rcn.push(rc.name)
	    end
      
      	@phone = u.phone_number
      	@message = "Reminder to contact #{@rcn.to_sentence(last_word_connector: ", or ")} today."

      client.account.sms.messages.create(
          :from => from,
          :to => @phone,
          :body => @message
        ) 
    end

  puts "ending contacts reminder task"
end

task :send_contacts_checkin_text_ET => :environment do
  puts "starting contact checkin task"
  
    account_sid = "AC3296e56896e36ea0b008cc879faf590c"
    auth_token = "59ebdbd467d8b29eb3b4416ed8491523"
    client = Twilio::REST::Client.new account_sid, auth_token
     
    from = "+18043136331" # Your Twilio number
    users = User.where("timezone IS ?", -5).where("text_alerts IS ?", true)
    users.to_a

    users.each do |u|
    	@rcn = []
    	puts u.name
    	@phone = u.phone_number
    	recent_updated = u.contacts.where("done IS ?", false).maximum("updated_at")

    	if recent_updated < Date.today.prev_day
      
		    u.contacts.where("done IS ?", false).order("created_at").limit(3).each do |rc|
		    	puts rc.name
		    	@rcn.push(rc.name)
		    end
	      
	      	
	      	@message = "Did you contact #{@rcn.to_sentence(last_word_connector: ", or ")} yesterday?"

	      client.account.sms.messages.create(
	          :from => from,
	          :to => @phone,
	          :body => @message
	        ) 
	  	else

	  		@message = "Sweetness! Looks like you made a contact yesterday. Nice work..."
	  		client.account.sms.messages.create(
	  			:from => from,
	  			:to => @phone,
	  			:body => @message
	  		)
	  	end
    end
  puts "ending contacts checkin task"
end

task :test_message => :environment do
	puts "starting test message"
	puts "ending test message"
end