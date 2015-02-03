class PeliculasController < ApplicationController
	layout 'private'
	def new
		@pelicula=Pelicula.new
	end
	def create
  	@pelicula = Pelicula.new(permit_params)

	  	if @pelicula.save
	  		redirect_to new_pelicula_path
	  	else
	  		render 'new'
	  	end
    end

    private

	def permit_params
  		params.require(:pelicula).permit(:tite, :category, :length, :description, :picture)
 	end

end
