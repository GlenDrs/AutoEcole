class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :public_room

      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
