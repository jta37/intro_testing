require 'rails_helper'

RSpec.describe Article, :type => :model do
  describe "articles" do

  	it "should have a title" do
  		article = Article.new({content: "you don't have a title"})
  		expect(article.save).to be(false)
  	end
  end
end
