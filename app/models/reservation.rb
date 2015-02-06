class Reservation < ActiveRecord::Base
belongs_to :show
has_many :showseats, :dependent => :destroy
has_one :billing, :dependent => :destroy
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :ci, presence: true


end