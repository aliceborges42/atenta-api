class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :complaint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
