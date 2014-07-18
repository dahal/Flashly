#POST Signup
get '/signup' do
	erb:'/users/signup'
end

post '/users/signup' do
	@user = User.create(params)
	session[:id] = @user.id
	redirect '/login'
end

#GET Signin
get '/login' do
	erb:'/users/login'
end

post '/users/login' do
	@user = User.find_by_email(params[:email])
	if @user && @user.password == params[:password]
		session[:id] = @user.id
		p session[:id]
		redirect '/profile'
	else
		redirect '/signup'
	end
end

get '/profile' do
	@user = User.find_by_id(session[:id])
	@gravatar = @user.email.to_s.gravatar
	erb:'/users/profile'
end

get '/logout' do
	session[:id] = nil
	redirect '/'
end

get '/admin' do
	if admin?
		'You are admin'
	else
		'Not an admin'
	end
end