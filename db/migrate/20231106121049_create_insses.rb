class CreateInsses < ActiveRecord::Migration[7.0]
  def change
    create_table :insses do |t|
      t.float :aliquot, null: false
      t.float :from, null: false
      t.float :to

      t.timestamps
    end
  end
end
