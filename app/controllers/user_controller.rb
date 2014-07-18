#POST Signup
get '/signup' do
	erb:'/users/signup'
end

post '/users/signup' do
	User.create(params)
	redirect '/login'
end

#GET Signin
get '/login' do
	erb:'/users/login'
end

post '/users/login' do
	@user = User.find_by_email(params[:email])
	if @user.password == params[:password]
		"Logged in"
	else
		#redirect '/signup'
		'Something went wrong...'
	end
end
