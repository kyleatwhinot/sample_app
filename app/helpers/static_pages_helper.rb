module StaticPagesHelper
	require 'date'

	def day_off?(dow)
    	["FRIDAY", "SATURDAY", "SUNDAY"].include?(dow)
  	end

  	def today
  		return DateTime.now.strftime('%^A')
  	end

  	def dft(dft)
  		DateTime.now.next_day(dft).strftime('%^A')
  	end

    def dft_day4
      if Date.today.wednesday? || Date.today.thursday?
        return 6
      else
        days_to_monday
      end
    end

    def dft_day3
      if Date.today.wednesday? || Date.today.thursday?
        return 5
      else
        days_to_monday
      end
    end


    def days_to_monday
      Date.today.next_week - Date.today
    end

    def contact_overdue?(user_id)
      @user = User.find_by_id(user_id)
      return true if (Date.today - (@user.last_contact_done_date || Date.tomorrow)) > 6
    end

    def ask_overdue?(user_id)
      @user = User.find_by_id(user_id)
      return true if (Date.today - (@user.last_ask_done_date || Date.tomorrow)) > 6
    end

    def ask_fu_overdue?(user_id)
      @user = User.find_by_id(user_id)
      return true if (Date.today - (@user.last_ask_fu_date || Date.tomorrow)) > 6
    end
end
