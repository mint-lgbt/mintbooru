# frozen_string_literal: true

class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
end
