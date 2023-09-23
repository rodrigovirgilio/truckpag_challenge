module Docs
  module ApiDetailsControllerDoc
    extend Apipie::DSL::Concern

    ########## PARAM GROUPS START #########
    def_param_group :products_serializer_atributes do
      property :database_read_status, String, desc: "Database read status", required: false
      property :database_write_status, String, desc: "Database write status", required: false
      property :last_cron_execution_time, Time, desc: "Last CRON execution time", required: false
      property :uptime, String, desc: "Database uptime", required: false
      property :memory_usage, String, desc: "Database memory usage", required: false
    end
    ########## PARAM GROUPS END ###########

    ########## ACTIONS DOC START ##########
    # api :GET, "/", "API Details"
    def_param_group :api_detail_controller_show do
      returns code: 200, desc: "OK" do
        param_group :products_serializer_atributes, ApiDetailsControllerDoc
      end
      error code: 401, desc: "Unauthorized"
    end
    ########## ACTIONS DOC END ############
  end
end
