get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.username}"
  end
  erb :index
end
