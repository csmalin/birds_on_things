get '/' do
  # Look in app/views/index.erb
  erb :index
end

### SIGNUP ###
get '/signup' do

  erb :signup
end

post '/signup' do

  erb :login
end

### LOG ON ###
get '/login' do

  erb :login
end

post '/login' do

end

### ALBUMS ###

post '/users/:user_id/albums' do

  redirect '/users/u:ser_id/albums'
end

get '/users/:user_id/albums' do

  erb :all_albums
end

get '/albums/:album_id/photos' do

  erb :single_album
end


### PHOTOS ###
post '/albums/:album_id/:photo_id' do

  redirect '/albums/:album_id/:photo_id'
end

get '/albums/:album_id/:photo_id' do

  erb :single
end



