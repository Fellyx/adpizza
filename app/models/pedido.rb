class Pedido < ActiveRecord::Base

	#Relacionamentos	
		belongs_to :cliente
		has_and_belongs_to_many :itens

	#Validações
		validates_presence_of :dt_pedido 
		validates :vl_total, presence:true, numericality: true
		validates_presence_of :cliente_id
		validates_associated  :cliente

		
		


	

end
