class FixColumnName < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :name, :first_name
      t.rename :surname, :last_name
    end
  end
end
