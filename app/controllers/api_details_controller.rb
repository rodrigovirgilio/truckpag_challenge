require "mongo"

class ApiDetailsController < ApplicationController
  include Docs::ApiDetailsControllerDoc

  api :GET, "/", "API Details"
  param_group :api_detail_controller_show, Docs::ApiDetailsControllerDoc
  def show
    # Prepare the response as a JSON object
    response_data = {
      database_read_status: check_database_read_status,
      database_write_status: check_database_write_status,
      last_cron_execution_time: last_cron_execution_time,
      uptime: calculate_uptime,
      memory_usage: memory_usage
    }

    render json: response_data
  end

  private

  def check_database_read_status
    read_result = client[:import_history].find({}).limit(1).to_a

    if read_result.empty?
      "Erro na conexão de leitura: Não foi possível ler um documento do banco de dados."
    else
      "Conexão de leitura está OK."
    end
  end

  def check_database_write_status
    document_to_insert = { name: "Exemplo", age: 30 }
    write_result = client[:import_history].insert_one(document_to_insert)

    if write_result.n == 1
      "Conexão de escrita está OK."
    else
      "Erro na conexão de escrita: Não foi possível inserir um documento no banco de dados."
    end
  end

  def last_cron_execution_time
    collection = client[:import_history]

    pipeline = [
      { "$sort" => { "import_date" => -1 } },
      { "$limit" => 1 }
    ]

    result = collection.aggregate(pipeline).first
    result["import_date"]
  end

  def calculate_uptime
    server_status = client.database.command(serverStatus: 1)

    uptime_seconds = server_status.first["uptime"].to_i

    uptime_hours = uptime_seconds / 3600

    return "#{uptime_hours} hours"
  end

  def memory_usage
    server_status = client.database.command(serverStatus: 1)

    memory_info = server_status.first["mem"]

    "Resident: #{memory_info['resident']} Virtual: #{memory_info['virtual']} in KB"
  end

  def client
    Mongo::Client.new("mongodb://#{ENV["MONGODB_URL"]}/truckpag_challenge_development")
  end
end
