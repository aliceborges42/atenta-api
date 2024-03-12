class Deslike < ApplicationRecord
    belongs_to :user
    belongs_to :complaint

    validates :user_id, uniqueness: { scope: :complaint_id, message: "You can only deslike a complaint once" }
end
