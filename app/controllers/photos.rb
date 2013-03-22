post '/albums/:album_id/:photo_id' do
  redirect '/albums/:album_id/:photo_id'
end

get '/albums/:album_id/:photo_id' do
  erb :single
end

get '/upload' do
  erb :upload
end

post '/upload' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    
    photo = Photo.new(:title => "a photo", :description => "some description", :image => params[:image])
    photo.save!

  end
  redirect "/users/#{params[:username]}/albums"
end
