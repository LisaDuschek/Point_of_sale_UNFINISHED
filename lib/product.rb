class Product < ActiveRecord::Base

  belongs_to(:purchase)
  validates(:description, :presence => true, :length => { :maximum => 50 })

end
