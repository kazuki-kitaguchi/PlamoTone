class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.references :user, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
