# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :asks, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :followed_users, through: :relationships, source: :followed
  has_many :memberships, dependent: :destroy
  #has_many :outcomes

  before_save { |user| user.email = email.downcase }
  before_save { create_remember_token }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  									uniqueness: { case_sensitive: false, message: "is already registered. Please sign in." }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # define this but to do it correctly need to setup a counter cache http://railscasts.com/episodes/23-counter-cache-column
  #scope :any_active_contacts, where("self.contacts.done IS ?", false).count > 0

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

=begin
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
=end

  def join!(group)
    memberships.create!(group_id: group.id)
  end

  def leave!(group)
    memberships.find_by_group_id(group.id).destroy
  end

  def member?(group)
    memberships.find_by_group_id(group.id)
  end

  def last_contact_done_days
      date_array = self.contacts.find(:all, :select => "date_done").to_a
      most_recent = date_array.max
      last_done = Date.today - most_recent[:date_done]
      return last_done
  end

  def last_contact_done_date
      self.contacts.order('date_done DESC').first.try(:date_done)
  end

  def last_ask_done_date
      self.asks.order('date_done DESC').first.try(:date_done)
  end

  def last_contact_fu_date
      self.contacts.order('date_followed_up DESC').first.try(:date_followed_up)
  end

  def last_ask_fu_date
      self.asks.order('date_followed_up DESC').first.try(:date_followed_up)
  end

  def last_activity_date
    ask_activity = self.asks.order('updated_at DESC').first.try(:updated_at)
    contact_activity = self.contacts.order('updated_at DESC').first.try(:updated_at)
    return [ask_activity, contact_activity].max
  end

  def ask_count(weeks)    
    wks = weeks.to_i
    self.asks.where(done: true, updated_at: (Date.today - wks.weeks)..Date.today).count
  end

  def contacts_count(weeks)    
    wks = weeks.to_i
    self.contacts.where(done: true, updated_at: (Date.today - wks.weeks)..Date.today).count
  end

  def top_contacts(count)
    self.contacts.where(done: false).order("due_at ASC").limit(count)
  end

  def top_asks(count)
    self.asks.where(done: false).order("created_at ASC").limit(count)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end