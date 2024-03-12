class CreateSecurityButtons < ActiveRecord::Migration[7.1]
  def change
    create_table :security_buttons do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
