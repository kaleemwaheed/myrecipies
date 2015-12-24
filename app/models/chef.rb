class Chef < ActiveRecord::Base
  has_many :recipes
  before_save{self.email=email.downcase}
    validates :chefname , presence: true, length:{maximum:25 , minimum:5}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email , presence:true ,length:{maximum:105} ,
     uniqueness:{case_sensitive: false },
     format:{with: VALID_EMAIL_REGEX }
end