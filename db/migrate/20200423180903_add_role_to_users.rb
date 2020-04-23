class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #add_column :users, :role, :integer, :default => 1
  end
end
