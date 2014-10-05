class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.string :kind
      t.string :name

      t.timestamps
    end
  end
end
