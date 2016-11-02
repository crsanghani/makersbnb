feature 'creating requests' do

  before(:each) do
    Space.first_or_create(name: 'The Hole', price: '75', location: Location.first_or_create(name: :Sheffield), description: 'Haunted.', available_from: Date.new(2016,10,31), available_to: Date.new(2016,11,03))
    visit 'spaces/1'
  end

  scenario 'I can request a range of dates when dates are available' do
    select '2016/10/31', :from => 'from'
    select '2016/11/03', :from => 'to'
    click_button 'Request booking'

    expect(page).to have_content 'Your request has been sent. Await confirmation!'
  end

  scenario 'I receive an error when one of the dates is NOT available' do
    select '2016/8/31', :from => 'from'
    select '2016/9/03', :from => 'to'
    click_button 'Request booking'

    expect(page).to have_content 'Your date range is not available. Check again, mortal!'
  end

end
