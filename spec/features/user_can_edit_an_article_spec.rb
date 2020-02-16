require 'rails_helper'
require 'factory_bot'

feature 'Edit an article' do
    context 'Successfully edit an article [Happy Path' do
      before do
  
        create(:article, title: 'Unbelievable story', content: 'You will not believe your ears')
        visit articles_path
        click_on 'Edit Article'
      end

      it 'User should be on edit article form' do
        article = Article.find_by(title: 'Unbelievable story')
        expect(current_path).to eq edit_article_path(article)
    end
  
      it 'User should see article title' do
    expect(page).to have_content 'You will'
     end
    end
  end