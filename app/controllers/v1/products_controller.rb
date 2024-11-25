class V1::ProductsController < ApplicationController
  # hook para executar o método :set_service antes de qualquer action
  before_action :set_service

  # GET /products
  # GET /products?name=productname
  def index
    @products = @product_service.find_all(name: params[:name])
  end

  # GET /products/:id
  def show
    product = @product_service.find_by_id(params.expect(:id))
    render partial: product
  rescue ResourceNotFoundError => error
    render_error error, status: :not_found
  end

  # POST /products
  def create
    product = @product_service.create(product_params)
    render partial: product, status: :created
  rescue ValidationError => error
    render_error error, status: :unprocessable_entity
  end

  # PATCH/PUT /products/:id
  def update
    product = @product_service.update(params.expect(:id), product_params)
    render partial: product, status: :ok
  rescue ResourceNotFoundError => error
    render_error error, status: :not_found
  rescue ValidationError => error
    render_error error, status: :unprocessable_entity
  end

  # DELETE /products/:id
  def destroy
    @product_service.delete(params.expect(:id))
  rescue ResourceNotFoundError => error
    render_error error, status: :not_found
  end

  # GET /products/count
  def count
    @total = @product_service.count
  end

  private
    # Instacia o serviço a ser usado nas actions
    def set_service
      @product_service = ::ProductService.new
    end

    # Permite apenas um lista de parâmetros confiáveis.
    def product_params
      params.expect(product: [ :name, :description, :price, :enabled ])
    end
end
