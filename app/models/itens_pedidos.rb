class ItensPedidos < ActiveRecord::Base
	self.table_name="itens_pedidos"

	#Relacionamentos
		has_one :item
		has_one :pedido

	#Validações
		validates_associated :item
		validates_associated :pedido

end	