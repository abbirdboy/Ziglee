class User 
  include Her::Model
  collection_path "register.php?"
  
  attributes :first, :last, :location, :email, :type
  
  
  private 
  
    #Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end 
  
end 