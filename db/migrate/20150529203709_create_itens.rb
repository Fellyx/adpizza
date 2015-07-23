class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
		t.string :nm_item
		t.float :qtd_item
		t.float :vl_item
		t.text :ds_item
		t.timestamps
    end
  end
end
