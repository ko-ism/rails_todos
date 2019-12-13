class User < ApplicationRecord
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  has_many :tasks, :dependent => :destroy
  before_save :encrypted_password
  validates :password, :presence => true, :confirmation => true

  def self.authenticate(email, password)
    find_by_email_and_password(email, Digest::SHA1.hexdigest(password))
  end

  private
  def encrypted_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end
end
