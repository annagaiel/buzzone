class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy

  geocoded_by :address               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :name, :presence => true, length: {minimum: 3}
  validates :address, :presence => true, uniqueness: true
  validates :description, :presence => true

  def self.search(search)
  	if search
    	where('name LIKE ?', "%#{search}%")
    else
    	all
    end
  end
end
