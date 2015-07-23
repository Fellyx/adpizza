class AddColumnCepToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :cep, :integer
  end
end
