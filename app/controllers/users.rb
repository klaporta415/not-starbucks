get '/login' do 
	erb :"users/login"
end 

post '/login' do
	@user = User.find_by(username: params[:username])
	if @user && @user.authenticate(params[:password]) == true
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = ["Your username or password was entered incorrectly."]
		erb :"users/login"
	end
end

get '/logout' do 
	session.delete(:user_id)
	redirect '/'
end

get '/users/new' do 
	erb :'users/new'
end

get '/users/:id' do 
	@user = User.find(params[:id])
	likes = Like.all 
	my_likes = likes.where(liker_id: @user.id)
	shops = my_likes.select{|like| like.coffee_shop_id }
	@liked_shops = []
	shops.each do |shop|
		@liked_shops << CoffeeShop.find(shop)
		@liked_shops
	end
	erb :'users/show'
end 

post '/users' do 
	@new_user = User.new(params[:user])
	if @new_user.save
		session[:user_id] = @new_user.id
		redirect "/users/#{@new_user.id}"
	else
		@errors = @new_user.errors.full_messages
		erb :"users/new"
	end
end