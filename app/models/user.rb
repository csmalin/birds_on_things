
class User < ActiveRecord::Base
  include BCrypt
  has_many :albums

  def password
    # this is called "memoization" (not to be confused with memoRization)
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

    def self.authenticate(username, password)
      @user = User.find_by_username(username)
      if (@user.password == password) 
        @user
      else
        nil
      end
      
      # returns the User if the password for the given username is correct, nil otherwise
    end

    def login(params)
      @user = User.find_by_email(params[:email])
      if @user.password == params[:password]
        @user.update_attributes(:token => SecureRandom.uuid)
        @user.save
      end
  end


end
