json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :cliente_id, :dt_pedido, :vl_total
  json.url pedido_url(pedido, format: :json)
end
