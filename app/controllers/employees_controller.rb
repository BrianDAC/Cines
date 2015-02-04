class EmployeesController < ApplicationController
	layout 'private'

	def index
		@reservation = Reservation.new
	end

	def reservation
		@pay = Payment.new
		#@reservation = Reservation.where(:ci => params[:ci])

		#@billings = Billing.where(:status => 0)

		@billings = Billing.joins(:reservation).where('reservations.ci' => params[:ci]).where(:status => 0)
	end

end
