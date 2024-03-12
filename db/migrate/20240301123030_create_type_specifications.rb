class CreateTypeSpecifications < ActiveRecord::Migration[7.1]
  def change
    create_table :type_specifications do |t|
      t.string :specification

      t.timestamps
    end
  end
end
