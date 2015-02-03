class UsersController < ApplicationController
  def index
  	@peliculas=Pelicula.all
  end
  def board
  	@peliculas=Pelicula.all
  	@shows=Show.all
  end
end
