class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :beer_clubs, :ciry, :city
  end
end
