get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(:username => params[:user][:username].downcase, :password => params[:user][:password], :email => params[:user][:email])
  if user.save
    user.albums << Album.create(:name => "Default Album", :url => "default_album")
    session[:user_id] = user.id
    redirect "/#{user.username}" 
  end
  erb :signup
end
