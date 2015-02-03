class Admin::PeliculasController < ApplicationController
	layout 'private'
	def new
		@peliculas=Pelicula.all
		@pelicula=Pelicula.new
	end
	def show
    	@pelicula = Pelicula.find(params[:id])
    end
	def create
	@peliculas=Pelicula.all
  	@pelicula = Pelicula.new(permit_params)

	  	if @pelicula.save
	  		redirect_to new_admin_pelicula_path
	  	else
	  		render 'new'
	  	end
    end
    def edit
      @pelicula = Pelicula.find(params[:id])
    end
	def destroy
	  @pelicula = Pelicula.find(params[:id])
	  @pelicula.destroy
	  redirect_to new_admin_pelicula_path
    end
    def update
    @pelicula = Pelicula.find(params[:id])

    if @pelicula.update(permit_params)
      redirect_to new_admin_pelicula_path
    else
      render 'edit'
    end
  end

    private

	def permit_params
  		params.require(:pelicula).permit(:tite, :category, :length, :description, :picture)
 	end

end
