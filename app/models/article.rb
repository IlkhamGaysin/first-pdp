class Article < ActiveRecord::Base
  paginates_per 10

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :description, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
