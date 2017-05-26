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

get '/users/:id' do 
	erb :'users/show'
end 