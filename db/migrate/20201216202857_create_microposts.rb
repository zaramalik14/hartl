class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
