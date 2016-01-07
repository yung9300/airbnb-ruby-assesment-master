class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :Location
			t.integer :Rooms
			t.integer :Bathrooms
			t.integer :Parking
			t.string :Price_p_n
			t.string :Description
			t.integer :user_id
			t.timestamps null: false
		end
	end
end
