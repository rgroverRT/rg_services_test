class StaticPagesController < ApplicationController
require 'api'

    def test_out_xml
        #output_type = params[:output_type]
        #logger.info "StaticPagesController test_out with type #{output_type.to_s} called."
        #@test_output = get_remote_data(output_type)
        @test_output = get_remote_data_xml
    end

    def test_out_json
        logger.info "StaticPagesController test_out with type JSON called."
        @test_output = get_remote_data_json
    end

    def test_out_custom
        logger.info "StaticPagesController test_out without using ActiveResource."
        @test_output = get_remote_data_custom
        render :test_out_xml
    end

    private
        def get_remote_data_xml     #(output_format)
            #subscription = { key1:  "value1", key2:  "value2", key3:  "value3", }
            Api::Subscription.format = :xml
            subscription = Api::Subscription.get(:oldest)
            return subscription
        end

        def get_remote_data_json
            Api::Subscription.format = :json
            subscription = Api::Subscription.get(:oldest)
            return subscription
        end

        def get_remote_data_custom
            subscription = { "product" => "hard-coded", "id" => "424242" }
            return subscription
        end

end
