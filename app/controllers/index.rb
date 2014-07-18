before '/flashcards/*' do
  redirect '/' unless logged_in?
end

before '/profile' do
  redirect '/' unless logged_in?
end

get '/' do
  if logged_in?
    @user = User.find_by_id(session[:id])
    @gravatar = @user.email.to_s.gravatar
  end
  erb:'index'
end


