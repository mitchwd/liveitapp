class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  
  has_many :tasks, :dependent => :destroy
  has_many :entries, :through => :tasks
  
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.image_url = auth["info"]["image"]
    end
  end
end
