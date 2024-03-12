class CreateComplaintTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :complaint_types do |t|
      t.string :classification

      t.timestamps
    end
  end
end
