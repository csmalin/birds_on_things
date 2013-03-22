post '/login' do  
  @user = User.authenticate(params[:user][:username].downcase, params[:user][:password])
  
  if @user
    session[:user_id] = @user.id
  else
    redirect '/'
  end

  redirect "/#{@user.username}"

end

get '/logout' do
  session.clear
  redirect '/'
end
