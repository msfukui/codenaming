class Products < ActiveRecord::Migration
  def up
    add_column :products, :path, :string
  end

  def down
    remove_column :products, :path, :string
  end
end
