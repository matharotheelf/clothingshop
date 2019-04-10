RSpec.feature 'ShopItems', type: :feature do
  describe 'User sees Shop home page' do
    scenario 'Shop home page welcomes to shop' do
      visit '/'
      expect(page).to have_content('Welcome to our clothing shop!')
    end
  end
end
