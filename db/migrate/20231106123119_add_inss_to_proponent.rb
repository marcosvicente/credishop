class AddInssToProponent < ActiveRecord::Migration[7.0]
  def change
    add_column :proponents, :inss_dedution, :float
    add_column :proponents, :inss_aliquot, :float
    add_column :proponents, :inss_liquid_salary, :float
  end
end
