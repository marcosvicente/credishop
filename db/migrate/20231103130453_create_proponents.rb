class CreateProponents < ActiveRecord::Migration[7.0]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.references :address, null: false, foreign_key: true
      t.date :birth_date
      t.decimal :salary, precision: 8, scale: 2
      
      t.timestamps
    end
  end
end
