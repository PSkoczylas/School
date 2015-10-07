class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.boolean :is_teacher
      t.integer :id_teacher
      t.integer :id_student
    end
  end
end
