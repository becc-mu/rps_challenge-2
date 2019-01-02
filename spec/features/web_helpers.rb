# frozen_string_literal: true

def sigin_in_as_sam
  visit '/'
  fill_in :player_name, with: 'Sam'
  click_button 'Submit'
end
