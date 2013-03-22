get '/signup' do

  erb :signup
end

post '/signup' do

  user = User.new(params[:user])

  redirect '/users/:user_id/albums' if user.save
  
  erb :signup

end
