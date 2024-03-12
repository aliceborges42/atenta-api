class ComplaintType < ApplicationRecord
    has_many :complaints, dependent: :destroy
end
