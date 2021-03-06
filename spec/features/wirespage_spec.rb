require 'rails_helper'

feature 'in wires page' do
  scenario 'click add wires button' do
    visit wires_view_path
    click_link "Dodaj kabel"
    expect(page.current_path).to eq wires_new_path
  end

  scenario 'click location button' do
    visit wires_view_path
    click_link "Wszystkie obiekty"
    expect(page.current_path).to eq locations_path
  end

  scenario 'click fibres button' do
    visit wires_view_path
    click_link "Wszystkie włókna"
    expect(page.current_path).to eq fibres_path
  end

  scenario 'add click location button' do
    visit wires_new_path
    click_link "Wszystkie kable"
    expect(page.current_path).to eq wires_view_path
  end

  scenario 'checking empty form to add wires' do
    visit wires_new_path
    click_button "Dodaj kabel"
    expect(page).to have_content "Błąd!"
  end

  scenario 'checking form to add wires' do
    visit locations_new_path
    fill_in "Nazwa obiektu", :with => "A1"
    click_button "Dodaj obiekt"
    fill_in "Nazwa obiektu", :with => "A2"
    click_button "Dodaj obiekt"
    visit wires_new_path
    fill_in "Nazwa", :with => "111"
    select("A1", from: "cable_from")
    select("A2", from: "cable_to")
    click_button "Dodaj kabel"
    expect(page).to have_content "Kabel utworzony pomyślnie"
  end

  scenario 'checking exsisting wires' do
    visit locations_new_path
    fill_in "Nazwa obiektu", :with => "A1"
    click_button "Dodaj obiekt"
    fill_in "Nazwa obiektu", :with => "A2"
    click_button "Dodaj obiekt"
    visit wires_new_path
    fill_in "Nazwa", :with => "111"
    select("A1", from: "cable_from")
    select("A2", from: "cable_to")
    click_button "Dodaj kabel"
    fill_in "Nazwa", :with => "111"
    select("A1", from: "cable_from")
    select("A2", from: "cable_to")
    click_button "Dodaj kabel"
    expect(page).to have_content "Błąd! Kabel istnieje!"
  end
end
