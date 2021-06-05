# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string           not null
#  role                :string           default("regular_user")
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable,:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :rememberable,
         :validatable

  ROLES = {
    admin: 'admin',
    regular_user: 'regular_user'
  }.freeze

  enum role: ROLES

  has_many :posts, dependent: :destroy, inverse_of: :author, foreign_key: 'author_id'

  validates :name, presence: true
  validates :role, inclusion: { in: User.roles.keys }

  before_validation :ensure_role, on: :create

  def self.permitted_attributes
    [
      :name,
      :role
    ]
  end

  private

  def ensure_role
    self.role = ROLES[:regular_user] unless role
  end
end
