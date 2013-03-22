class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :password_hash, :email, :token
      t.timestamps
    end
  end
end
