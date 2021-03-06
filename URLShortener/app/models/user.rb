# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
    through: :visits,
    source: :urls

  has_many :unique_visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :urls

    
end
