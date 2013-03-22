get '/users/:user_name/albums' do
  @user = User.find_by_username(params[:user_name])
  @albums = @user.albums
  erb :all_albums
end

get '/users/:user_name/albums/new_album' do
  if session[:user_id]
     @user = User.find(session[:user_id])
    erb :new_album
  else
    redirect "/users/#{params[:user_name]}/albums"
  end
  
end

post '/users/:user_name/albums/new_album' do
  if session[:user_id]
    @user = User.find(session[:user_id])

    # @user = User.find_by_username(params[:user_name])
    @user.albums.create(:name => params[:album][:name], :description => params[:album][:description])
  end
  redirect "/users/#{params[:user_name]}/albums"
end




get '/albums/:album_id/photos' do

  erb :single_album
end


