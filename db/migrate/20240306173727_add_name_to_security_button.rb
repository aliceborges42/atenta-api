class AddNameToSecurityButton < ActiveRecord::Migration[7.1]
  def change
    add_column :security_buttons, :name, :string
  end
end
