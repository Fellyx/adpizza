class CreateItensPedidosJoinTable < ActiveRecord::Migration
  def change
  	create_table :itens_pedidos, id: false do |t|
  		t.integer :item_id
		t.integer :pedido_id
	end
  end
end
