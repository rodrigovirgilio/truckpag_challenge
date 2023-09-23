class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUS = {
    daft: "daft",
    trash: "trash",
    published: "published"
  }.freeze

  field :code, type: Integer
  field :status, type: String, default: Product::STATUS[:daft]
  field :imported_t, type: Time, default: Time.now
  field :url, type: String
  field :creator, type: String
  field :created_t, type: Integer
  field :last_modified_t, type: Integer
  field :product_name, type: String
  field :quantity, type: String
  field :brands, type: String
  field :categories, type: String
  field :labels, type: String
  field :cities, type: String
  field :purchase_places, type: String
  field :stores, type: String
  field :ingredients_text, type: String
  field :traces, type: String
  field :serving_size, type: String
  field :serving_quantity, type: Float
  field :nutriscore_score, type: Integer
  field :nutriscore_grade, type: String
  field :main_category, type: String
  field :image_url, type: String

  validates :code, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  validates :status, :imported_t, presence: true

  index({ code: 1 }, { unique: true, name: "product_code_index", background: true })
end
