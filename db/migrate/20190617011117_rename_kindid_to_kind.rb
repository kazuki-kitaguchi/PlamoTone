class RenameKindidToKind < ActiveRecord::Migration[5.2]
  def change
    rename_column :colors, :kind_id, :kind
  end
end
