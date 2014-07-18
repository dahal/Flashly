helpers do
	def current_user
		session[:id]
	end

	def logged_in?
		current_user
	end

	def admin?
		User.find_by_id(current_user).role == 'admin'
	end
end
