require 'rails_helper'
require 'factory_bot'

feature 'Edit an article' do
    context 'Successfully edit an article [Happy path]' do
      before do
  
        create(:article, title: 'Unbelievable story', content: 'You will not believe your ears')

        visit articles_path
        click_on "Edit"
        fill_in "Content", with: "You will not believe your ears. Edit! You will pretty much beleive your ears once you read this"
        click_on "Edit Article"
      end

      it 'Content' do
        expect(page).to have_content 'Edit! You will pretty much beleive your ears once you read this'
      end

      before do

        visit articles_path
        click_on "Edit"
        fill_in "Title", with: "Plain story"
        click_on "Edit Article"
      end

      it 'Title' do
        expect(page).to have_content 'Plain story'
      end

    end
end