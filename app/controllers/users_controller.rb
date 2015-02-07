class UsersController < ApplicationController
  def index
  	@peliculas=Pelicula.all
  end
  def board
  	@peliculas=Pelicula.all
  	@shows=Show.all
  end

  def movie
    @show = Show.where(:pelicula_id => params[:id]).first
  end

end
