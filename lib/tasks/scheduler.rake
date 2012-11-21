desc "This task is called by the Heroku scheduler add-on"
require 'twilio-ruby'

task :send_contacts_reminder_text_ET => :environment do
  puts "starting contact reminder task"
    
    account_sid = "AC3296e56896e36ea0b008cc879faf590c"
    auth_token = "59ebdbd467d8b29eb3b4416ed8491523"
    client = Twilio::REST::Client.new account_sid, auth_token 
    from = "+18043136331" # Your Twilio number

    users = User.where(timezone: -5, text_alerts: true)
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
    	@phone = u.phone_number

    	if u.last_contact_date < Date.today.prev_day
      
		    u.top_contacts(3) do |rc|
		    	@rcn.push(rc.name)
		    end
	      	
	      @message = "Did you make any of these contacts yesterday: #{truncate(rcn.to_sentence(last_word_connector: ", or "), length: 110, separator: ' ', omission: '...')}?"

	      client.account.sms.messages.create(
	          :from => from,
	          :to => @phone,
	          :body => @message
	        ) 
	  	else

	  		@message = "Looks like you made a contact yesterday! Nice work..."
	  		client.account.sms.messages.create(
	  			:from => from,
	  			:to => @phone,
	  			:body => @message
	  		)
	  	end
    end
  puts "ending contacts checkin task"
end

task :send_weekly_email_reminder => :environment do

  users = User.all
  users.to_a

  users.each do |u|
    top_contacts = []
    top_asks = []
    
    u.top_contacts(3).each do |n|
      top_contacts.push(n.name)
    end

    u.top_asks(3).each do |a|
      top_asks.push(a.description)
    end

    WeeklyReminder.ContactsAndAsks(u, top_contacts, top_asks).deliver
  end
end

task :test_message => :environment do
	puts "starting test message"
	puts "ending test message"
end