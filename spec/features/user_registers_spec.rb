# frozen_string_literal: true

feature 'User registers' do
  scenario 'user submits his/her name' do
    visit '/'
    fill_in :player_name, with: 'Sam'
    click_button 'Submit'
    expect(page).to have_content 'Sam'
  end
end
