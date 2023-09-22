require "net/http"
require "zlib"
require "json"
require "mongo"

namespace :import_files do
  desc "Import files to database"

  task call: :environment do
    URL = "https://challenges.coode.sh/food/data/json/index.txt".freeze

    text_file_url = URI.parse(URL)
    response = Net::HTTP.get_response(text_file_url)

    if response.code == "200"
      # Read and list each file of the text file
      files = response.body.split("\n")
      files.each do |file|
        gzipped_url_file = URI.parse("https://challenges.coode.sh/food/data/json/#{file}")

        response_product_file = Net::HTTP.get_response(gzipped_url_file)

        unzip_file(file, response_product_file)
      end
    else
      puts "Failed to fetch the file. HTTP Status: #{response.code}"
    end
  end

  private

  def unzip_file(file, response_product_file)
    return unless file || response_product_file

    # Check if the request was successful (HTTP status code 200)
    if response_product_file.code == "200"
      gzipped_data = response_product_file.body
      # Create a temporary file to store the gzipped data
      temp_gzipped_file = "temp.gz"

      # Write the gzipped data to the temporary file
      File.open(temp_gzipped_file, "wb") do |file|
        file.write(gzipped_data)
      end

      # Initialize a Zlib::GzipReader to decompress the file
      gzipped_file_io = Zlib::GzipReader.open(temp_gzipped_file)

      # Read and parse only the first 100 files of the gzipped file
      files_to_read = 100
      files_read = 0

      gzipped_file_io.each_line do |file|
        # Increment the files_read counter
        files_read += 1

        # Parse the JSON object
        json_object = JSON.parse(file)

        # Process the JSON data (e.g., print it)
        # puts JSON.pretty_generate(json_object)

        create_product(json_object)

        # Check if we have read the specified number of files
        break if files_read >= files_to_read
      end

      # Clean up by closing the gzipped file and deleting the temporary gzipped file
      gzipped_file_io.close
      File.delete(temp_gzipped_file) if File.exist?(temp_gzipped_file)

      puts "***" * 30
      puts "Importing file #{file}"
      puts "***" * 30

      # Import history
      import_history(file)
    else
      puts "Failed to fetch the file. HTTP Status: #{response.code}"
      import_history(file, "File error #{file}")
    end
  end

  def import_history(file, error_details=nil)
    client = Mongo::Client.new("mongodb://localhost:27017/truckpag_challenge_development")
    collection = client[:import_history]

    import_history_document = {
      import_date: Time.now,
      file_name: "#{file}",
      error_details: error_details
    }

    collection.insert_one(import_history_document)
  end

  def create_product(object)
    Product.create(
      code: object["code"],
      status: Product::STATUS[:daft],
      imported_t: Time.now,
      url: object["url"],
      creator: object["creator"],
      created_t: object["created_t"],
      last_modified_t: object["last_modified_t"],
      product_name: object["product_name"],
      quantity: object["quantity"],
      brands: object["brands"],
      categories: object["categories"],
      labels: object["labels"],
      cities: object["cities"],
      purchase_places: object["purchase_places"],
      stores: object["stores"],
      ingredients_text: object["ingredients_text"],
      traces: object["traces"],
      serving_size: object["serving_size"],
      serving_quantity: object["serving_quantity"],
      nutriscore_score: object["nutriscore_score"],
      nutriscore_grade: object["nutriscore_grade"],
      main_category: object["main_category"],
      image_url: object["image_url"]
    )
  end
end
