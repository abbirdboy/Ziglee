class JobsController < ApplicationController

  def index
    @search = params[:search]
    if params[:search].blank?
      @jobs = Job.search() #would use ipgecode in production, default = San Ramon, CA
      @markers = Array.new 
      for i in 0..@jobs.response[:offers].length-1 do 
        @markers[i] = {lng: @jobs.response[:offers][i][:offer][:longitude],
                                           lat: @jobs.response[:offers][i][:offer][:latitude], infowindow: "#{i+1}. #{@jobs.response[:offers][i][:offer][:title]}"} 
      end 
      respond_to do |format|
          format.html
          format.js
      end 
    else 
      @jobs = Job.search(@search) #would use ipgeocode in production, default = San Ramon, CA
      @markers = Array.new 
      for i in 0..@jobs.response[:offers].length-1 do 
        @markers[i] = {lng: @jobs.response[:offers][i][:offer][:longitude],
                                           lat: @jobs.response[:offers][i][:offer][:latitude], infowindow: "#{i+1}. #{@jobs.response[:offers][i][:offer][:title]}"} 
      end
      respond_to do |format|
          format.html
          format.js
      end  
    end
  end 
  
  
end
