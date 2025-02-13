feature 'peep creator displayed' do
  scenario 'a user can see who wrote the peeps' do 
    sign_up
    fill_in('peep', with: 'Hello World')
    click_button('Post')
    
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'CRISPR posted:'
  end
end
