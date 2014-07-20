require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "presence" do
    article = Article.new
    assert article.invalid?
    assert article.errors.include?(:title)
    assert article.errors.include?(:body)
    assert article.errors.include?(:released_at)
  end

  test "length" do
    article = Factory.build(:article)
    article.title = "A" * 201
    assert article.invalid?
    assert article.errors.include?(:title)
  end

  test "expired_at" do
    article = Factory.build(:article)
    article.released_at = Time.current
    article.expired_at = 1.days.ago
    assert article.invalid?
    assert article.errors.include?(:expired_at)
  end

  test "no_expiration" do
    article = Factory.build(:article)
    article.no_expiration = true
    assert article.valid?
    assert_nil article.expired_at
  end
end
