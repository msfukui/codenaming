class AddColumnItems < ActiveRecord::Migration
  def up
    add_column :items, :file, :string
  end

  def down
    remove_column :items, :file, :string
  end
end
