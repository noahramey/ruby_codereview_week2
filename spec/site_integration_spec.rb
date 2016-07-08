require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the site path', {:type => :feature}) do
  it('takes the user on a tour through the sites basic functionality') do
    visit('/')
    click_on('Add a Word')
    expect(page).to have_content('Add a Word')
    fill_in('word', :with => 'Pug')
    click_on('Add Word')
    expect(page).to have_content('Successfully created Word!')
    click_on('View All Words')
    expect(page).to have_content('Pug')
    click_on('Pug')
    expect(page).to have_content('Pug')
    click_on('Add a new definition')
    fill_in('definition', :with => 'A small dog.')
    click_on('Add Definition')
    expect(page).to have_content('Successfully added a definition to your word!')
    click_on('View All Words')
    click_on('Pug')
    expect(page).to have_content('Definition: A small dog.')
  end
end
