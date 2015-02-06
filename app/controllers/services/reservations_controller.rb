class Services::ReservationsController < ApplicationController
	def new
		@reservations=Reservation.all
		@reservation=Reservation.new
		@ocupados=[]
		@comprados=[]
		@show=Show.find(params[:show])
	end


	def create
		@reservations=Reservation.all
		@reservation = Reservation.new(permit_params)
		if @reservation.save
			@id=''
			@aux = 0
			(0..@reservation.seat.length).each do |i|
					if @reservation.seat[i] == ',' || @aux == 3 || i == @reservation.seat.length
						@name_seat=Seat.where(:seat => @id).first
						@change_stat=Showseat.where(:show_id => @reservation.show_id).where(:seat_id => @name_seat.id).first
						@change_stat.status = 2
						@change_stat.reservation_id=@reservation.id
						@change_stat.save
						@id = ''
						@aux = 0
					else
						if @reservation.seat[i].nil?

						else
							@aux = @aux + 1
							@id = @id + @reservation.seat[i]
						end
					end
			end


			if Showseat.where(:show_id => @reservation.show.id).where(:status => 0).count <= 0
				@show = Show.where(:id => @reservation.show.id).first
				@show.status = 1
				@show.save
			end

			redirect_to :controller => '/billings', :action => 'details', :id => @reservation.id, :valor => '1'
		else
			render 'new'
		end
	end

	def edit
		@reservation= Reservation.find(params[:id])
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to new_services_reservation_path
	end
	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update(permit_params)
			redirect_to new_services_reservation_path
		else
			render 'edit'
		end
	end


	private

	def permit_params
		params.require(:reservation).permit(:name, :lastname, :email, :ci, :seat, :elderly, :show_id)
	end















end
