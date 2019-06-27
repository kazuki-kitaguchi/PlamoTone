class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :color_name
      t.string :color_code

      t.timestamps
    end
  end
end
