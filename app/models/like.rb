class Like < ActiveRecord::Base
  belongs_to :liker, class_name: "User"
  belongs_to :coffee_shop
end
