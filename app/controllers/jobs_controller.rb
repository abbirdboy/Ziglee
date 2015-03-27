class JobsController < ApplicationController
  
  def index
    @search = params[:search]
    if params[:search].blank?
      @jobs = Job.search() #would use ip to geocoder in production, default = San Ramon, CA
    else 
      @jobs = Job.search(@search) #would use ip to geocoder in production, default = San Ramon, CA
    end
  end 
  
  
  
  
  
end
