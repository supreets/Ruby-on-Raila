class ItemImage < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    belongs_to :item
    validates :item_id, presence: true
    validates :picture, presence: true
    #validate :picture_size
    
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "image size can't be greater than 5MB")
        end
    end
end
