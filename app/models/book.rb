class Book < ApplicationRecord
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  enum status: {
    available: 0,
    reserved: 1,
    sold: 2
  }

  validates :title, :author, :price, :condition, :location, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  scope :available_only, -> { where(status: :available) }
  scope :by_author, ->(author) { where('author ILIKE ?', "%#{author}%") if author.present? }
  scope :by_condition, ->(condition) { where(condition: condition) if condition.present? }
  scope :by_location, ->(location) { where('location ILIKE ?', "%#{location}%") if location.present? }
  scope :price_between, ->(min, max) { 
    where('price >= ? AND price <= ?', min, max) if min.present? && max.present?
  }
  
  before_validation :set_coordinates, if: :location_changed?

  def set_coordinates
    coordinates = {
      "Shaw College" => [22.4205, 114.2079],
      "United College" => [22.4178, 114.2075],
      "Wu Yee Sun College" => [22.4185, 114.2045],
      "Morningside College" => [22.4190, 114.2060],
      "CW Chu College" => [22.4160, 114.2050]
    }
    
    if coordinates[location]
      self.latitude = coordinates[location][0]
      self.longitude = coordinates[location][1]
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["author", "condition", "location", "price", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.conditions_list
    ['Like New', 'Very Good', 'Good', 'Acceptable']
  end
end