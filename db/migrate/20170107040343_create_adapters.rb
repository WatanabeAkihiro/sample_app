class CreateAdapters < ActiveRecord::Migration
  def change
    create_table :adapters do |t|

      t.timestamps null: false
    end
  end
end
