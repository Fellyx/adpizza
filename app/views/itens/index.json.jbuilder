json.array!(@itens) do |item|
  json.extract! item, :id, :nm_item, :qtd_item, :vl_item, :ds_item
  json.url item_url(item, format: :json)
end
