class Item < ActiveRecord::Base
	self.table_name = "itens"

	#Validações
		validates :nm_item, presence: true, length: {maximum: 255}
		validates :qtd_item, presence: true, numericality: true
		validates :vl_item, presence: true, numericality: true
		validates :ds_item, presence:true

	#Relacionamentos
		has_and_belongs_to_many :pedidos
		
end
