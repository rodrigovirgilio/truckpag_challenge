class Api::V1::ProductsController < Api::V1::ApplicationController
  include Docs::ProductsControllerDoc

  before_action :find_product, only: %i[show update destroy]

  api :GET, "/v1/products", "List of Products"
  param_group :product_controller_index, Docs::ProductsControllerDoc
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    all_products = Product.all
    @pagy = Pagy.new(count: all_products.count, page: page, items: per_page)
    @products = all_products.skip((page.to_i - 1) * per_page.to_i).limit(per_page.to_i)

    render json: @products, status: :ok
  end

  api :GET, "/v1/products/:code", "List of Product by code"
  param_group :product_controller_show, Docs::ProductsControllerDoc
  def show
    if @product
      render json: @product, status: :ok
    else
      head :unprocessable_entity
    end
  end

  api :PUT, "/v1/products/:code", "Update Product by code"
  param_group :product_controller_update, Docs::ProductsControllerDoc
  def update
    if @product
      @product&.update(product_params)

      render json: @product
    else
      head :unprocessable_entity
    end
  end

  api :DELETE, "/v1/products/:code", "Delete Product by code"
  param_group :product_controller_destroy, Docs::ProductsControllerDoc
  def destroy
    if @product
      @product.update(status: Product::STATUS[:trash])

      render json: @product
    else
      head :unprocessable_entity
    end
  end

  private

  def product_params
    params.permit(
      :code,
      :status,
      :imported_t,
      :url,
      :creator,
      :created_t,
      :last_modified_t,
      :product_name,
      :quantity,
      :brands,
      :categories,
      :labels,
      :cities,
      :purchase_places,
      :stores,
      :ingredients_text,
      :traces,
      :serving_size,
      :serving_quantity,
      :nutriscore_score,
      :nutriscore_grade,
      :main_category,
      :image_url
    )
  end

  def find_product
    @product = Product.where(code: params[:code]).first
  rescue Mongoid::Errors::DocumentNotFound => error
    render json: { error: error.message }, status: 404
  end
end
