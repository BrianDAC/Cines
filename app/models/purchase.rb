class Purchase < ActiveRecord::Base
  belongs_to :show
  has_one :billing, :dependent => :destroy
  has_many :showseats, :dependent => :destroy
end
