module Api
    class Subscription < ActiveResource::Base
        self.site = 'http://localhost:3000'

        schema do
            attribute 'product', 'string'
        end




    end

end