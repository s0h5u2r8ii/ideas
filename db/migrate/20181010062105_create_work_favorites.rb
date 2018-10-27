class CreateWorkFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :work_favorites do |t|
      t.integer :user_id
      t.integer :work_id
      t.timestamps
    end
  end
end
