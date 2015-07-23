class ChangeColumnNameNmClientesToNmClienteInCliente < ActiveRecord::Migration
  def change
  	rename_column :clientes, :nm_clientes, :nm_cliente
  end
end
