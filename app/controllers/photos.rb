post '/albums/:album_id/:photo_id' do

  redirect '/albums/:album_id/:photo_id'
end

get '/albums/:album_id/:photo_id' do

  erb :single
end
