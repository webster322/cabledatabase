require 'rails_helper'

feature 'in location page' do
  scenario 'click add location button' do
    visit locations_path
    click_link "Dodaj obiekt"
    expect(page.current_path).to eq locations_new_path
  end

  scenario 'click cable button' do
    visit locations_path
    click_link "Wszystkie kable"
    expect(page.current_path).to eq wires_view_path
  end

  scenario 'click fibres button' do
    visit locations_path
    click_link "Wszystkie włókna"
    expect(page.current_path).to eq fibres_path
  end

  scenario 'add click location button' do
    visit locations_new_path
    click_link "Wszystkie obiekty"
    expect(page.current_path).to eq locations_path
  end

  scenario 'checking empty form to add location' do
    visit locations_new_path
    click_button "Dodaj obiekt"
    expect(page).to have_content "Błąd!"
  end

  scenario 'checking form to add location' do
    visit locations_new_path
    fill_in "Nazwa obiektu", :with => "A23"
    click_button "Dodaj obiekt"
    expect(page).to have_content "Obiekt utworzony pomyślnie"
  end

  scenario 'checking exsisted location' do
    visit locations_new_path
    fill_in "Nazwa obiektu", :with => "A23"
    click_button "Dodaj obiekt"
    fill_in "Nazwa obiektu", :with => "A23"
    click_button "Dodaj obiekt"
    expect(page).to have_content "Błąd! Obiekt istnieje!"
  end
end
