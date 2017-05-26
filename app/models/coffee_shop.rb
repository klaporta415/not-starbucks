class CoffeeShop < ActiveRecord::Base
  has_many :likes
  has_many :likers, through: :likes
end
