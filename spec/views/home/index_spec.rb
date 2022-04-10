require 'rails_helper'

RSpec.describe "home/index", type: :view do
  
  describe 'ルートページ' do
    before do
      visit root_path
    end

    it '見出しが表示' do
      expect(page).to have_content 'Come on, liars'
    end

    it 'Sign upボタンが表示' do
      expect(page).to have_content 'Sign up'
    end

    it 'Log inボタンが表示' do
      expect(page).to have_content 'Log in'
    end
  end
end
