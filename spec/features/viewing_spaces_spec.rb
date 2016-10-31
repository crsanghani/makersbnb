feature 'Viewing spaces' do

  scenario 'I can see existing spaces on the spaces page' do
    Space.create(name: 'Luxury Box', price: 500, location: 'London')

    visit '/spaces'

    expect(page.status_code).to eq 200

    within 'ul#spaces' do
      expect(page).to have_content('Luxury Box')
    end

  end

end
