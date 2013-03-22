get '/signup' do

  erb :signup
end

post '/signup' do

  user = User.new(params[:user])
  if user.save
    user.albums << Album.create(:name => "Default Album")
    redirect "/users/#{user.username}/albums" 
  end

  erb :signup

end
