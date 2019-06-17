class AddMakerToColors < ActiveRecord::Migration[5.2]
  def change
    add_reference :colors, :maker, foreign_key: true
  end
end
