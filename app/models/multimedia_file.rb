class MultimediaFile < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :file

  validates :title, presence: true
  validates :file, presence: true

  def file_url
    url_for(file)
  end
end
