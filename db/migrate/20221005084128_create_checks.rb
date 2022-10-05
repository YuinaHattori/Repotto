class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.integer :report_id
      t.integer :user_id

      t.timestamps
    end
  end
end
