class AddColorNumberToColors < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :color_number, :string
  end
end
