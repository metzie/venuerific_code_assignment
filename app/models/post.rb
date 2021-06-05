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
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :author, class_name: 'User', inverse_of: :posts

  validates :title, presence: true, length: { minimum: 3 }
  validates :excerpt, presence: true, length: { minimum: 20 }
  validates :content, presence: true, length: { minimum: 40 }
  validates :published_at, presence: true, if: :published

  delegate :name, :email, to: :author, prefix: true

  default_scope {  order(published_at: :desc) }
  scope :reversed, -> { order(published_at: :asc) }
  scope :published, -> { where(published: true) }

  def self.permitted_attributes
    [
      :title,
      :excerpt,
      :content,
      :published,
      :published_at,
      :meta_keywords,
      :meta_description,
    ]
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
