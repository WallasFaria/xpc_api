class ProductService
  def find_all(name: nil)
    products = Product.all
    products = products.where(name: name) if name.present?
    products
  end

  def find_by_id(id)
    product = Product.find_by(id: id)
    raise ResourceNotFoundError.new(:id, id) if product.nil?
    product
  end

  def create(params)
    product = Product.new(params)
    return product if product.save

    raise ValidationError.new(product.errors.full_messages)
  end

  def update(id, params)
    product = find_by_id(id)
    return product if product.update(params)

    raise ValidationError.new(product.errors.full_messages)
  end

  def delete(id)
    find_by_id(id).destroy!
  end

  def count
    Product.count
  end
end
