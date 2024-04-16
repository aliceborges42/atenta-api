class CreateTermOfUses < ActiveRecord::Migration[7.1]
  def change
    create_table :term_of_uses do |t|
      t.text :content

      t.timestamps
    end
  end
end
