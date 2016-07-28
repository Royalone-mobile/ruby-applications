require 'json'
class PdfToXlsController < ApplicationController
  	def index
  	end
  	def show_selected
  		@selected_data=params[:selected_data]
  		respond_to do |format|
		  	format.xls	
		end
  	end
  	def show
  		begin
	  		file = params[:source]
			read_pdf(file)
			respond_to do |format|
			  	format.html
			  	format.xls	
			end
		rescue Exception => e
			flash[:error]=e.message
  			redirect_to "/error"
  		end
  	end

	def present

		respond_to do |format|
		  	format.html
		  	format.xls	
		end
	end
	def error
		
	end
	def change_page
		file=params[:source]
		read_pdf(file)
		page_no=params[:page_number].to_i
		@res=@result[page_no]
		respond_to do |format|
		 	format.js
		end
	end
	def read_pdf(file)
		@reader = PDF::Reader.new(file)
			text=''
			count=0
			@response=[]
			@result=[]
			@reader.pages.each do |page|
				count=count+1	  
				@result[count]=[]
			 	text=page.text.split("\n")
			  	text.each do |tt|
			  		#puts "+++++++++ #{tt}"
			  		r=tt.split(" ")
			  		@result[count] << r
			  		@response << r
			 	end	
			  	
			end
	end
end
