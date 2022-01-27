class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image

  validates :name, uniqueness:true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }


  # def favorited_by?(book_id)
  #   favorites.where(book_id: book_id).exists?
  # end

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
