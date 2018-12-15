class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
include SearchUser
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :mesages
  has_many :entries
  has_many :ideas, dependent: :destroy
  has_many :idea_favorites, dependent: :destroy
  has_many :favorite_ideas, dependent: :destroy
  has_many :idea_comments, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :work_favorites, dependent: :destroy
  has_many :work_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :message_notifications, dependent: :destroy
  has_many :work_notifications, dependent: :destroy

  validates :user_name, presence: true, length: { maximum: 8 }
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :name_phonetic, presence: true , length: { maximum: 50 } ,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, presence: true, length: { is: 11 }

def soft_delete
    update(deleted_at: Time.now)
  end

  def active_for_authentication?
  !deleted_at
end

def inactive_message
  !deleted_at ? super : :deleted_account
  end

def self.search(search) #ここでのself.はUser.を意味する
    if search
      User.where(['user_name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      User.all #全て表示。User.は省略
    end
  end
end
