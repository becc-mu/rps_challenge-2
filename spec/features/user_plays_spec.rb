# frozen_string_literal: true

feature 'Player registers' do
  scenario 'player submit a name' do
    visit '/'
    fill_in :player_name, with: 'Sam'
    click_button 'Submit'
    expect(page).to have_content 'Sam'
  end
end

feature 'User plays rps' do
  scenario 'user submits move and gets his move displayed' do
    visit '/play'
    click_button 'Submit'
    # it will need to display back the user move
    expect(page).to have_content('rock')
  end

  scenario 'user submits move and gets move result' do
    visit '/move'
    fill_in :move, with: 'rock'
    click_button 'Submit'
    # also contain a You Win or You Lose statement
    expect(page).to have_content('You Win').or have_content('You Lose')
  end
end
