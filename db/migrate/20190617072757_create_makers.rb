class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :maker_name

      t.timestamps
    end
  end
end
