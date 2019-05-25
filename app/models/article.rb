class Article < ApplicationRecord
  belongs_to :user

  include Elasticsearch::Model

  enum publish_flag: [:draft, :published]
end
