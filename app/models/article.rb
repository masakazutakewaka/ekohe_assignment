class Article < ApplicationRecord
  include Elasticsearch::Model
  index_name "#{Rails.env}_articles"

  belongs_to :user

  enum publish_flag: [:draft, :published]

  after_save { ElasticSearchIndexArticlesJob.perform_later('index',  self.id) }
  after_destroy { ElasticSearchIndexArticlesJob.perform_later('delete', self.id) }
end
