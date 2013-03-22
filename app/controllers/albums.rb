get '/users/:username/albums' do
  @user = User.find_by_username(params[:username].downcase)
  @albums = @user.albums
  erb :all_albums
end

get '/users/:username/albums/new_album' do
  if session[:user_id]
     @user = User.find(session[:user_id])
    erb :new_album
  else
    redirect "/users/#{params[:username]}/albums"
  end
  
end

post '/users/:username/albums/new_album' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @user.albums.create(:name => params[:album][:name], :description => params[:album][:description])
  end
  redirect "/users/#{params[:username]}/albums"
end




get '/albums/:album_id/photos' do
  erb :single_album
end


