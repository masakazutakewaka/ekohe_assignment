class Article < ApplicationRecord
  belongs_to :user

  include Elasticsearch::Model
end
