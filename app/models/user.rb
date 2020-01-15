class User < ApplicationRecord
  attr_accessor :crop_x,
                :crop_y,
                :crop_w,
                :crop_h

  before_create :confirmation_token
  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # validates :telephone, presence: true, uniqueness: true
  validates_presence_of :password, on: :create
  validate :image_size

  has_many :room_messages, dependent: :destroy
  has_many :favorites
  has_many :comments
  has_one_attached :avatar
  has_one_attached :background_image
  has_and_belongs_to_many :friends,
                        class_name: 'User',
                        join_table: :friends,
                        foreign_key: :user_id,
                        association_foreign_key: :friend_id

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def image_size
    if self.avatar.attached?
      avatar.blob.analyze
      errors.add :avatar, 'too big!' if avatar.blob.metadata[:width] > 4096
      errors.add :avatar, 'too small!' if avatar.blob.metadata[:width] < 200 || avatar.blob.metadata[:height] < 200
    end
    if self.background_image.attached?
      background_image.blob.analyze
      errors.add :background_image, 'too big!' if background_image.blob.metadata[:width] > 4096
      errors.add :background_image, 'too small!' if background_image.blob.metadata[:width] < 200 || background_image.blob.metadata[:height] < 200
    end
  end

  def cropped_avatar
    return self.avatar.variant(crop: self.avatar_coords ).processed
  end

  def cropped_background
    return self.background_image.variant(crop: self.background_coords ).processed
  end

  def large
    return self.avatar.variant(resize: '600x600').processed
  end

  def thumb
    return self.avatar.variant(resize: '100x100').processed
  end

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
