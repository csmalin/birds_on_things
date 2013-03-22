post '/login' do  
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  
  if @user
    session[:user_id] = @user.id
  else
    redirect '/'
  end

  redirect "/users/#{@user.username}/albums"

end

get '/logout' do
  session.clear
  redirect '/'
end
