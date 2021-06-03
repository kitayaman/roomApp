class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  has_many :reservations

  def self.search(search)
    if search
      Room.where(['address LIKE ?',"%#{search}%"])
    else
      Room.all
    end
  end

  

  validates :name, presence: true
  validates :room_image, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
  # validates :person_num, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validate :today_check

  # def today_check
  #   errors.add(:start_date, "本日以降を選択してください") if start_date.nil? || start_date < Date.today
  # end

end
