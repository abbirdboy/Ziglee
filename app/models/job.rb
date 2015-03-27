class Job
  include Her::Model
  collection_path "hiring.php?" 
  
  def self.search(q = ' ', latitude = '37.73132', longitude = '-121.90968')
     self.create(:q => q, :latitude => latitude, :longitude => longitude)
  end
  
end 