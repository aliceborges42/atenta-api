class TypeSpecification < ApplicationRecord
    has_many :complaints, dependent: :destroy
end
