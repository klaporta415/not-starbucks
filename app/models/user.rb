class User < ActiveRecord::Base

  has_many :likes
  has_many :coffee_shops, through: :likes

  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def password 
  	@password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
  	@password = BCrypt::Password.create(new_password)
  	self.hashed_password = @password
  end

  def authenticate(entered_password)
  	BCrypt::Password.new(self.hashed_password) == entered_password
  end

  def liked_shops
    likes = Like.all
    my_likes = likes.where(liker_id == self.id)
    shops = my_likes.coffee_shop_id
    shop_names = shops.to_a.select {|shop| shop.name}
  end
  
end

