class ElasticSearchIndexArticlesJob < ApplicationJob
  queue_as :elasticsearch_articles

  Client = Elasticsearch::Client.new(host: ENV['ELASTIC_SEARCH'] || 'localhost:9200')

  def perform(operation, id)
    logger.debug "Operation: #{operation}, ID: #{id}"

    case operation.to_s
      when /index/
        article = Article.find(id)
        Client.index  index: 'articles', type: 'article', id: article.id, body: article.__elasticsearch__.as_indexed_json
      when /delete/
        begin
          Client.delete index: 'articles', type: 'article', id: id
        rescue Elasticsearch::Transport::Transport::Errors::NotFound
          logger.debug "Article not found, ID: #{id}"
        end
      else raise ArgumentError, "Unknown operation: #{operation}"
    end
  end
end
