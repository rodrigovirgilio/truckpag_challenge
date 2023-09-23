class ProductSerializer < ActiveModel::Serializer
  attributes :code, :status, :imported_t, :url, :creator, :created_t,
    :last_modified_t, :product_name, :quantity, :brands, :categories, :labels,
    :cities, :purchase_places, :stores, :ingredients_text, :traces,
    :serving_size, :serving_quantity, :nutriscore_score, :nutriscore_grade,
    :main_category, :image_url

  def imported_t
    object.imported_t&.strftime("%d/%m/%y: %H:%M:%S")
  end
end
