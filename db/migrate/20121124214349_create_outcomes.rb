class CreateOutcomes < ActiveRecord::Migration
	def change
	    create_table :outcomes do |t|
	      t.string	:description
	      t.integer	:ask_id
	      t.integer	:contact_id
	      t.string	:dominant_emotion
	      t.float	:intensity
	    end
	end
end
