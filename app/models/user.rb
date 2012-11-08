class User < ActiveRecord::Base
  attr_accessible :birth_date, :country_id, :email, :email_verified, :name, :password, :username,:photo_url,:gender,:connection_id
  validate_presence_of :birth_date, :country_id, :email, :email_verified, :name, :password, :username,:photo_url,:gender,:connection_id
  validate_uniqueness_of :email, :username
end
