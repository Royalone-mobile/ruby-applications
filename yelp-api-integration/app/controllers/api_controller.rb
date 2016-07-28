require 'base64'
require 'openssl'

class ApiController < ApplicationController

	  layout false
   	before_filter :authenticate

   def authenticate
   		authenticate_request = request.headers["HTTP_AUTHORIZATION"]

   		if !authenticate_request.nil?
   			decrypt_key = Base64.decode64(authenticate_request)
   			if !decrypt_key.nil?
   				if decrypt_key !="XACretuq3cra"
   					render json:get_response("Unauthorized","401","The request did not have valid authorization credentials.","")
            return false
   				end
   			else
   				render json:get_response("Key Missing","403","Permission denied. The Authentication parameters are missing.","")
   				return false
   			end
   		else		
   			render json:get_response("Bad Request","400","Permission denied. The Authentication parameters are missing.","")
   			return false
   		end
   end

   def return_business_details
   	begin
   		business_details = Business.all
   		business_array = Array.new
   		business_details.each do |bus|
   			business_array << {id:bus.id, name:bus.name, phone:bus.phone, rating:bus.rating, address:bus.address, yelp_id:bus.yelp_id}
   		end	
   		render json:get_response("success","200","The request was processed and returned successfully. Nothing was changed.",business_array)
   	rescue Exception => e
   		render json:get_response("Server Error","500","We have got a problem on our side. If this persists please contact support. We log and review all errors but your help often helps us fix it quicker.","")
   	end
   	
   end

   private

      def get_response(status,error_code,error_message,data)
         result={status:status,status_code:error_code,response_text:error_message,data:data }
      end

end
