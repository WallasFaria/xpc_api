xml.product do
  xml.id product.id
  xml.name product.name
  xml.description product.description
  xml.price product.price.to_f
  xml.enabled product.enabled
  xml.created_at product.created_at
  xml.updated_at product.updated_at
end
