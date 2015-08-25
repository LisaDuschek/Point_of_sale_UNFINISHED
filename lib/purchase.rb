class Purchase < ActiveRecord::Base
  has_many(:products)
  validates(:date, :presence => true)
end
