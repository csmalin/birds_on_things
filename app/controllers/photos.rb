post '/albums/:album_id/:photo_id' do
  redirect '/albums/:album_id/:photo_id'
end

get '/albums/:album_id/:photo_id' do
  erb :single
end

get '/upload' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :upload
  else
    redirect "/"
  end
end

post '/upload' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    photo = Photo.new(params[:image])
    photo.save!
    @user.albums.find(params[:album_id]).photos << photo
    @user.save
  end
  redirect "/users/#{@user.username}/albums"
end
