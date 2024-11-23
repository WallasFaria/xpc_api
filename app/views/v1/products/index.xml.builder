xml.products do
  @products.each do |product|
    xml << render(partial: product)
  end
end
