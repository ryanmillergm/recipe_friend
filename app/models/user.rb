class User < ApplicationRecord
  attr_accessor :crop_x,
                :crop_y,
                :crop_w,
                :crop_h,
                :photo_crop_x,
                :photo_crop_y,
                :photo_crop_w,
                :photo_crop_h

  after_update :crop

  before_create :confirmation_token
  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :telephone, presence: true, uniqueness: true
  validates_presence_of :password, on: :create

  has_many :favorites
  has_many :comments
  has_one_attached :avatar
  has_one_attached :background_image
  has_and_belongs_to_many :friends,
                        class_name: 'User',
                        join_table: :friends,
                        foreign_key: :users_id,
                        association_foreign_key: :friend_id

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def cropped_avatar
    return self.avatar.variant(crop: self.avatar_coords ).processed
  end

  def large
    return self.avatar.variant(resize: '600x600').processed
  end

  def thumb
    return self.avatar.variant(resize: '100x100').processed
  end

  def crop
    if self.crop_x.present?
      x = self.crop_x.to_i
      y = self.crop_y.to_i
      w = self.crop_w.to_i
      h = self.crop_h.to_i
      self.update(avatar_coords: "#{w}x#{h}+#{x}+#{y}")
      # return self.avatar.variant(crop: "#{w}x#{h}+#{x}+#{y}").processed
      binding.pry
      # return self.update(avatar_coords: "#{w}x#{h}+#{x}+#{y}")
      # self.avatar.variant(combine_options: {crop: "#{w}x#{h}+#{x}+#{y}" })
    end
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
