class EmployeesController < ApplicationController
	layout 'private'
	def reservation
		@reservations=Reservation.all
	end
end
