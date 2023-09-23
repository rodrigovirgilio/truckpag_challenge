module Docs
  module ProductsControllerDoc
    extend Apipie::DSL::Concern

    ########## PARAM GROUPS START #########
    def_param_group :products_serializer_atributes do
      property :code, Integer, desc: "Product Code", required: true
      property :status, String, desc: "Product Status", required: true
      property :imported_t, Time, desc: "Product Imported_t", required: true
      property :url, String, desc: "Product URL", required: false
      property :creator, DateTime, desc: "Product Creator", required: false
      property :created_t, Integer, desc: "Product Created_t", required: false
      property :last_modified_t, Integer, desc: "Product Last_modified_t", required: false
      property :product_name, String, desc: "Product Product Name", required: false
      property :quantity, String, desc: "Product Quantity", required: false
      property :brands, String, desc: "Product Brands", required: false
      property :categories, String, desc: "Product Categories", required: false
      property :labels, String, desc: "Product Labels", required: false
      property :cities, String, desc: "Product Cities", required: false
      property :purchase_places, String, desc: "Product Purchase Places", required: false
      property :stores, String, desc: "Product Stores", required: false
      property :ingredients_text, String, desc: "Product Ingredients Text", required: false
      property :traces, String, desc: "Product Traces", required: false
      property :serving_size, String, desc: "Product Serving Size", required: false
      property :serving_quantity, Float, desc: "Product serving Quantity", required: false
      property :nutriscore_score, Integer, desc: "Product Nutriscore Score", required: false
      property :nutriscore_grade, String, desc: "Product Nutriscore Grade", required: false
      property :main_category, String, desc: "Product Main Category", required: false
      property :image_url, String, desc: "Product Image URL", required: false
    end
    ########## PARAM GROUPS END ###########

    ########## ACTIONS DOC START ##########
    # api :GET, "/v1/products", "Products index"
    def_param_group :product_controller_index do
      returns code: 200, desc: "OK" do
        param_group :products_serializer_atributes, ProductsControllerDoc
      end
      error code: 401, desc: "Unauthorized"
    end

    # api :GET, "/v1/products/:code", "Products by code"
    def_param_group :product_controller_show do
      returns code: 200, desc: "OK" do
        param_group :products_serializer_atributes, ProductsControllerDoc
      end
      error code: 401, desc: "Unauthorized"
    end

    # api :PUT, "/v1/products/:code", "Update product by code"
    def_param_group :product_controller_update do
      returns code: 200, desc: "OK" do
        param_group :products_serializer_atributes, ProductsControllerDoc
      end
      error code: 401, desc: "Unauthorized"
      error code: 404, desc: "Not Found"
    end

    # api :DELETE, "/v1/products/:code", "Delete product by code"
    def_param_group :product_controller_destroy do
      returns code: 204, desc: "No content"
      error code: 401, desc: "Unauthorized"
      error code: 404, desc: "Not Found"
    end
    ########## ACTIONS DOC END ############
  end
end
