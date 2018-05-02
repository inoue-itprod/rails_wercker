require_relative '../spec_helper.rb'

RSpec.describe 'Article Feature' do
  let(:article_index_page) { ArticleIndex.new }

  describe 'visiting the articles list' do
    subject { article_index_page.load }

    before { subject }

    example do
      expect(article_index_page).to be_displayed
    end
  end
end
