json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nm_cliente, :num_tel_cliente, :nm_endereco_cliente, :num_endereco, :nm_complemento, :nm_bairro, :nm_cidade, :nm_uf, :cep
  json.url cliente_url(cliente, format: :json)
end
