class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  has_many :lists, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true

  def item_count
    item_count = 0
    lists.each do |list|
      item_count += list.items.count
    end
    return item_count
  end
end
