class RenameMakeridToMaker < ActiveRecord::Migration[5.2]
  def change
    rename_column :colors, :maker_id, :maker
  end
end
