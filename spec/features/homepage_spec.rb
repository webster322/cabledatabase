require 'rails_helper'

feature 'my home page' do
  scenario 'click cable button' do
    visit root_path
    click_link "Wyświetl kable dostępne w bazie"
    expect(page.current_path).to eq wires_view_path
  end

  scenario 'click location button' do
    visit root_path
    click_link "Wyświetl obiekty dostępne w bazie"
    expect(page.current_path).to eq locations_path
  end

  scenario 'click fibres button' do
    visit root_path
    click_link "Wyświetl włókna dostępne w bazie"
    expect(page.current_path).to eq fibres_path
  end

  scenario 'click cable link' do
    visit root_path
    click_link("Wszystkie kable")
    expect(page.current_path).to eq wires_view_path
  end

  scenario 'click location button' do
    visit root_path
    click_link "Wszystkie obiekty"
    expect(page.current_path).to eq locations_path
  end

  scenario 'click fibres button' do
    visit root_path
    click_link "Wszystkie włókna"
    expect(page.current_path).to eq fibres_path
  end
end
