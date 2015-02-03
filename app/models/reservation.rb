class Reservation < ActiveRecord::Base
belongs_to :show, inverse_of: :reservations
has_many :showseats
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :ci, presence: true

end
