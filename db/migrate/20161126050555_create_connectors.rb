class CreateConnectors < ActiveRecord::Migration
  def change
    create_table :connectors do |t|
      t.references :comment, index: true, foreign_key: true
      t.references :micropost, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
