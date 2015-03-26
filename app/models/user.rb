class User 
  include Her::Model
  collection_path "register.php?"
  before_save :downcase_email
  
  attributes :first, :last, :location, :email, :type, :password
  
  validates :first, presence: true, length: { maximum: 25 }
  validates :last, presence: true, length: { maximum: 25 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }

  
  
  private 
  
    #Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end 
  
end 