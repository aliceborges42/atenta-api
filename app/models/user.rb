class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
  
  has_one_attached :avatar

  has_many :complaints, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :deslikes, dependent: :destroy

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true

  def image_url
    if avatar.attached?
      return Rails.application.routes.url_helpers.rails_blob_url(avatar)
    else
      default_avatar = Rails.root.join("app", "assets", "images", "default_avatar.png")
      avatar_blob = ActiveStorage::Blob.create_after_upload!(
        io: File.open(default_avatar),
        filename: "default_avatar.png",
        content_type: "image/png"
      )
      return Rails.application.routes.url_helpers.rails_blob_url(avatar_blob) if avatar_blob
    end
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?(token)
    (reset_password_sent_at + 4.hours) > Time.now.utc && reset_password_token == token
  end

  def reset_password!(password, password_confirmation)
    self.reset_password_token = nil
    self.password = password
    self.password_confirmation = password_confirmation
    save!
  end

  def generate_token
    SecureRandom.hex(3)
  end

end
