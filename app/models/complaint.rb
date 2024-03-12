class Complaint < ApplicationRecord
    has_many_attached :images
    
    belongs_to :user
    belongs_to :complaint_type
    belongs_to :type_specification


    has_many :likes, dependent: :destroy
    has_many :deslikes,dependent: :destroy
end
