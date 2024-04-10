class Complaint < ApplicationRecord
    has_many_attached :images, dependent: :destroy
    
    belongs_to :user
    belongs_to :complaint_type
    belongs_to :type_specification


    has_many :likes, dependent: :destroy
    has_many :deslikes,dependent: :destroy

    def self.ransackable_associations(auth_object = nil)
        []
      end

def self.ransackable_attributes(auth_object = nil)
  %w[complaint_type_id date description hour latitude longitude status type_specification_id]
end

end
