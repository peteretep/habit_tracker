class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name
      t.integer :streak

      t.timestamps
    end
  end
end
