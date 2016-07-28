require 'constants'
#Created by : Ksolves 
#Created at : 27-Aug-2014

class ApplicationController < ActionController::Base
  	# "trap_request" Method will be triggered before any other method
  	before_filter :trap_request
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	# Method to trap to request and save in database
  	def trap_request  	
	   
	    # This will check that either we have to trap this one or not
      	if METHOD_TO_TRAP.include?(params[:action].to_s)
      		res={trap_id:params[:id], request_date:Date.today ,remote_ip:request.remote_ip.to_s, request_method:request.method.to_s, scheme:request.method.to_s, query_string:request.query_string.to_s, query_params:request.params.inspect, cookies:request.cookies.inspect, headers:request.headers.inspect, original_fullpath:request.original_fullpath.to_s, request_method:request.request_method.to_s, referer:request.referer.to_s, fullpath:request.fullpath.to_s,}
      		r=Requests.create res
      	end
	   
 	end
end
