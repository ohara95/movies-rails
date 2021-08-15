class Movie < ApplicationRecord
  has_many :schedules
  
  validates :name, presence: true, length: { maximum: 160 }, uniqueness: true
  validates :year, length: { maximum: 45 }, numericality: { only_integer: true }
  validates :image_url, length: { maximum: 150 }

  def self.search(search, is_showing) 
    if search 
      if is_showing == "0"
        Movie.where(['name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"]).where(is_showing: "0")
      elsif is_showing == "1"
        Movie.where(['name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"]).where(is_showing: "1")
      else
        Movie.where(['name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"])
      end
    else
      Movie.all
    end
  end
end
