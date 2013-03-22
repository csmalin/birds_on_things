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
    photo = Photo.new(:title => params[:image][:title], :image => params[:image][:image], :description => params[:description], :url => params[:image][:title].gsub(/ /, '_').downcase)
    photo.save!
    @user.albums.find(params[:album_id]).photos << photo
    @user.save
  end
  redirect "/#{@user.username}"
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
    redirect "/#{@user.username}"
  end
  redirect '/'
end

get '/:username' do
  @user = User.find_by_username(params[:username].downcase)
    @albums = @user.albums
  erb :all_albums
end

get '/:username/:album_url' do
  @user = User.find_by_username(params[:username])
  @album = @user.albums.find_by_url(params[:album_url])
  erb :single_album
end

