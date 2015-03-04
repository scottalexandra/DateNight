class Image < ActiveRecord::Base
  validates_presence_of :url
  belongs_to :event
end
