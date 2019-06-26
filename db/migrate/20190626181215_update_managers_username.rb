class UpdateManagersUsername < ActiveRecord::Migration
  def change
    rename_column :managers, :name, :username 
  end
end
