class Seat < ActiveRecord::Base
	has_many :show_seats
	has_many :shows, :through => :show_seats
end
