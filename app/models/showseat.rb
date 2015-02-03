class Showseat < ActiveRecord::Base
  belongs_to :show
  belongs_to :seat
  belongs_to :reservation
end
