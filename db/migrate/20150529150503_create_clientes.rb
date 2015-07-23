class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nm_clientes
      t.integer :num_tel_cliente
      t.string :nm_endereco_cliente
      t.integer :num_endereco
      t.string :nm_complemento
      t.string :nm_bairro
      t.string :nm_cidade
      t.string :nm_uf
      t.timestamps
    end
  end
end
