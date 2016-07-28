#Created by : Ksolves 
#Created at : 27-Aug-2014
class TrapController < ApplicationController
  def index
  end

  def show
  end
  #Method to show all requests
  def show_request
  	@requests=Requests.where("trap_id=?",params[:id])
  end
  #Method to show details of a selected request
  def show_request_details
  	 @request_d=Requests.find(params[:request_id])
  end
end
