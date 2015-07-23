class AddColumnsInItensPedidos < ActiveRecord::Migration
  def change
  	add_column :itens_pedidos, :qtd_item_pedido, :float
  	add_column :itens_pedidos, :vl_item_pedido, :float
  end
end
