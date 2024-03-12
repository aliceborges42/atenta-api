class AddJtiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
