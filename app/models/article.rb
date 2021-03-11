class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy #delete comments when article is deleted.

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def created_days_ago
    ((Time.new - created_at) / 86_400).to_i
  end
end
