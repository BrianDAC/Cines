class Billing < ActiveRecord::Base
	belongs_to :reservation
	belongs_to :purchase
	has_one :show, :through => :reservation
end
