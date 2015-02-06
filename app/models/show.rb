class Show < ActiveRecord::Base
  belongs_to :pelicula, inverse_of: :shows
  belongs_to :room, inverse_of: :shows
  belongs_to :schedule, inverse_of: :shows
  has_many :reservations, :dependent => :destroy
  has_many :purchases, :dependent => :destroy
  has_many :showseats, :dependent => :destroy
  validates :pelicula, presence: true
  validates :room, presence: true
  validates :schedule, presence: true
  validates_uniqueness_of :schedule, scope: :room
end
