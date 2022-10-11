class AddDateToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :date, :datetime
  end
end
