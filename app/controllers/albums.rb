get '/users/:username' do
  @user = User.find_by_username(params[:username].downcase)
  @albums = @user.albums
  erb :all_albums
end

get '/new_album' do
  if session[:user_id]
     @user = User.find(session[:user_id])
    erb :new_album
  else
    redirect "/"
  end 
end

post '/new_album' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    album = underscore(params[:album][:name])
    @user.albums.create(:name => params[:album][:name], :url => params[:album][:name].gsub(/ /, '_').downcase, :description => params[:album][:description])
    redirect "/users/#{@user.username}"
  end
  redirect '/'
end

get '/albums/:album_id/photos' do
  erb :single_album
end


