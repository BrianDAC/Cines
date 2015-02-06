class Pelicula < ActiveRecord::Base
	has_many :shows, :dependent => :destroy
	validates :tite, presence: {message: "Debe tener un titulo"}
	validates :category, presence: {message: "Debe tener una categoria"}
	validates :length, presence: {message: "Debe tener una duracion"}, numericality: { only_integer: true }
	validates :description, presence: {message: "Debe tener una descripcion"}, length: { maximum: 400}
	validates :picture, presence: {message: "Debe tener un Url de una imagen"}

end
