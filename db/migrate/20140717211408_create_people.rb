class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
