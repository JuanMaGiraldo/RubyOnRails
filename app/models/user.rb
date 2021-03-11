class User < ApplicationRecord
  has_secure_password

  has_many :articles, dependent: :destroy

  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'follower_id',
                                    dependent: :destroy

  has_many :followeds, through: :follower_relationships

  has_many :followed_relationships, class_name: 'Relationship', foreign_key: 'followed_id',
                                    dependent: :destroy

  has_many :followers, through: :followed_relationships

  validates :email, :username, :password, presence: true

  validates :email, uniqueness: true,
                    email_format: { message: "Doesn't look like an email address" }

  validates :password, length: { minimum: 5 }

  def follow(blogger)
    followeds << blogger
  end

  def unfollow(followed_blogger)
    followeds.delete followed_blogger
  end

  def follows_blogger?(blogger)
    followeds.include?(blogger)
  end

  def owner?(article)
    articles.include?(article)
  end
end
