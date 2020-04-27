require "rails_helper"
require "factory_bot"

feature "Edit an article" do
  context "Successfully edit an article [Happy path]" do
    before do
      create(:article, title: "Unbelievable story", content: "You will not believe your ears")

      visit articles_path
      click_on "Edit"
      fill_in "Content", with: "You will not believe your ears. Edit! You will pretty much beleive your ears once you read this"
      click_on "Edit Article"
    end

    it "Content" do
      expect(page).to have_content "Edit! You will pretty much beleive your ears once you read this"
    end

    before do
      visit articles_path
      click_on "Edit"
      fill_in "Title", with: "Plain story"
      click_on "Edit Article"
    end

    it "Title" do
      expect(page).to have_content "Plain story"
    end

    it "User should see success message" do
      expect(page).to have_content "Article was successfully edited"
    end
  end

  context "User doesn't enter a title or content when editing an article [Sad Path]" do
    before do
      create(:article, title: "Unbelievable story", content: "You will not believe your ears")

      visit articles_path
      click_on "Edit"
      fill_in "Title", with: ""
      fill_in "Content", with: "Now that I think about it..."
      click_on "Edit Article"
    end

    it "User should see error message for missing title" do
      expect(page).to have_content "error prohibited this article from being saved"
    end

    before do
      fill_in "Title", with: "Plain story"
      fill_in "Content", with: ""
      click_on "Edit Article"
    end

    it "User should see error message for missing content" do
      expect(page).to have_content "Content can't be blank"
    end
  end
end
