class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :micropost_id
      t.integer :user_id
      # likeしているかしていないかで必要となるデータ
      t.boolean :is_like
    end
  end
end
