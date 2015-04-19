# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  name       :string
#  image      :string
#  token      :string
#  expires_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at) if auth.provider == 'facebook'
      user.save!
    end
  end
end
