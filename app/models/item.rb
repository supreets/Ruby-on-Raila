class Item < ActiveRecord::Base
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true, length: {maximum: 500}
    validates :category_id, presence: true
    validates :email, presence: true
    has_many :item_images, dependent: :destroy
    accepts_nested_attributes_for :item_images
    belongs_to :category
    
     def self.search(searchq)
        if searchq
            where('title LIKE ?',"%#{searchq}%") 
        else
           all
        end
     end
end
