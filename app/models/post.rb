class Post < ActiveRecord::Base
  acts_as_voteable

  belongs_to :user
  has_many :comments
  has_karma :comments

  validates :title, :presence => true, :uniqueness => true
  validates :url, :url_format => true, :if => Proc.new { |a| a.body.blank? }
  validates :url, :presence => true, :if => Proc.new { |a| a.body.blank? }
  validates :body, :length => { :within => 20..10000 }, :allow_blank => true, :if => Proc.new { |a| a.url.blank? }

  after_create :vote_on_post

  default_scope where(:status => nil)

  scope :commented, joins(:comments).group("users.id") # Just reference :comments
  scope :latest, order("posts.created_at DESC").limit(20)
  scope :less_than_7_days_old, lambda { where("posts.status IS NULL AND posts.created_at >= ?", Time.zone.now - 7.days)}


  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-').downcase}"
  end

  def mark_as_deleted
    self.status = "deleted"
    self.save
  end

  def vote_on_post
    user.vote_for(self)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  body       :text
#  status     :string(255)
#

