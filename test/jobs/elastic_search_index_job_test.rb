require 'test_helper'

class ElasticSearchIndexArticlesJobTest < ActiveJob::TestCase
  setup do
    Article.__elasticsearch__.refresh_index!
    user = User.create(email: 'test@com', password: 'test')
    @article = user.articles.create(title: 'test', content: 'test_content')
  end

  test 'index' do
    ElasticSearchIndexArticlesJob.perform_now('index', @article.id)
    res = Article.search('test')
    assert_equal 1, res.results.total
  end

  test 'delete' do
    ElasticSearchIndexArticlesJob.perform_now('delete', @article.id)
    res = Article.search('test')
    assert_equal 0, res.results.total
  end
end
