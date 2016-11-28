class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :comment, index: true, foreign_key: true
      t.references :micropost, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
