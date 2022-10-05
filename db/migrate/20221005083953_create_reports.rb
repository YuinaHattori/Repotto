class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.text :content
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
