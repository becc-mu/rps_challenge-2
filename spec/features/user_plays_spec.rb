# frozen_string_literal: true

feature 'Player registers' do
  scenario 'should raise an error' do
    visit '/'
    click_button 'Submit'
    visit ''
    expect(page).to have_content 'Error! A name must be entered'
  end

  scenario 'player submit a name' do
    sigin_in_as_sam
    expect(page).to have_content 'Sam'
  end

  scenario 'user submits move and gets his move displayed' do
    sigin_in_as_sam
    visit '/play'
    choose('move_rock')
    expect(page).to have_selector("input[value='rock']")
  end
end
