class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :cliente_id
      t.date :dt_pedido
      t.float :vl_total
      t.timestamps
    end
  end
end
