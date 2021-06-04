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
end
