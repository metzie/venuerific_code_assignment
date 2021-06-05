# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  title            :string           not null
#  slug             :string           not null
#  excerpt          :string
#  content          :text
#  published        :boolean
#  published_at     :datetime
#  meta_keywords    :string
#  meta_description :text
#  author_id        :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author, class_name: 'User', inverse_of: :posts

  validates :title, presence: true, length: { minimum: 3 }
  validates :excerpt, presence: true, length: { minimum: 20 }
  validates :content, presence: true, length: { minimum: 40 }

  delegate :name, to: :author, prefix: true


  scope :published, -> { where(published: true) }
  scope :recent, -> { order(published_at: :desc) }
  scope :oldest, -> { order(published_at: :asc) }
end
