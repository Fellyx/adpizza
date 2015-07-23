class Cliente < ActiveRecord::Base

	

	#Validações
		validates :nm_cliente, presence: true, length: {maximum: 150}		
		validates :nm_endereco_cliente, presence: true, length: {maximum: 220}
		validates :cep, presence: true, length: {maximum: 8}, numericality: true
		validates :nm_uf, presence: true, length: {maximum: 2}
		validates :num_tel_cliente, presence: true, numericality: true
		validates_presence_of  :nm_bairro, :nm_cidade	

	#Relacionamentos
		has_many	:pedidos

end
