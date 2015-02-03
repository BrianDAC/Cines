class Employees::ShowsController < ApplicationController
	layout 'private'
	def new
		@shows=Show.all
		@show=Show.new
		@seats=Showseat.all
	end
	def show
		@show = Show.find(params[:id])
	end
	def create
		@shows=Show.all
		@show = Show.new(permit_params)
		if @show.save
			if @show.room.number == 4
				(1..200).each do |i|
					@seat= Showseat.new
					@seat.show_id=@show.id
					@seat.seat_id=i
					@seat.status=0
					@seat.save
				end
			else
				(1..100).each do |i|
					@seat= Showseat.new
					@seat.show_id=@show.id
					@seat.seat_id=i
					@seat.status=0
					@seat.save
				end
			end

			redirect_to new_employees_show_path
		else
			render 'new'
		end
	end

	def edit
		@show = Show.find(params[:id])
	end

	def destroy
		@show = Show.find(params[:id])
		@show.destroy
		redirect_to new_employees_show_path
	end

	def update
		@show = Show.find(params[:id])

		if @show.update(permit_params)
			redirect_to new_employees_show_path
		else
			render 'edit'
		end
	end

	private

	def permit_params
		params.require(:show).permit(:schedule_id, :room_id, :pelicula_id)
	end
end
