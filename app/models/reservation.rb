class Reservation < ActiveRecord::Base
belongs_to :show
has_many :showseats
has_one :billing
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :ci, presence: true


end