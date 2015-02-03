class Billing < ActiveRecord::Base
	belongs_to :reservation, inverse_of: :billings
	belongs_to :purchase, inverse_of: :billings
end
