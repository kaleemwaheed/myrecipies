class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id ,presence:true
    validates :name,   presence:true ,length: { minimum:5 , maximum:100 }
    validates :summary,presence:true,length: { minimum:5 , maximum:100 }
    validates :description, presence:true,length: { minimum:5 , maximum:500 } 
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture,"Should be lss than 5 mb")
        end
        
      end
end