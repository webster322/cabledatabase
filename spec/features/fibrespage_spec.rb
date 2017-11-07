require 'rails_helper'

feature 'in fibres page' do
  scenario 'click add fibres button' do
    visit fibres_path
    click_link "Dodaj włókno"
    expect(page.current_path).to eq fibres_new_path
  end

  scenario 'click location button' do
    visit fibres_path
    click_link "Wszystkie obiekty"
    expect(page.current_path).to eq locations_path
  end

  scenario 'click wires button' do
    visit fibres_path
    click_link "Wszystkie kable"
    expect(page.current_path).to eq wires_view_path
  end

  scenario 'add click fibres button' do
    visit fibres_new_path
    click_link "Wszystkie włókna"
    expect(page.current_path).to eq fibres_path
  end

  scenario 'checking empty form to add fibres' do
    visit fibres_new_path
    click_button "Dodaj włókno"
    expect(page).to have_content "Błąd!"
  end

  scenario 'checking form to add fibres' do
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
    visit fibres_new_path
    fill_in "Nr włókna", :with => "1"
    select("111", from: "fibre_name")
    select("A1", from: "fibre_location")
    fill_in "Półka", :with => "1"
    fill_in "Nazwa systemu", :with => "AG"
    fill_in "Nazwa szafy", :with => "PS1"
    fill_in "Pomieszczenie", :with => "401"
    click_button "Dodaj włókno"
    expect(page).to have_content "Włókno utworzone pomyślnie"
  end
  scenario 'checking exsisting fibres' do
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
    visit fibres_new_path
    fill_in "Nr włókna", :with => "1"
    select("111", from: "fibre_name")
    select("A1", from: "fibre_location")
    fill_in "Półka", :with => "1"
    fill_in "Nazwa systemu", :with => "AG"
    fill_in "Nazwa szafy", :with => "PS1"
    fill_in "Pomieszczenie", :with => "401"
    click_button "Dodaj włókno"
    fill_in "Nr włókna", :with => "1"
    select("111", from: "fibre_name")
    select("A1", from: "fibre_location")
    fill_in "Półka", :with => "1"
    fill_in "Nazwa systemu", :with => "AG"
    fill_in "Nazwa szafy", :with => "PS1"
    fill_in "Pomieszczenie", :with => "401"
    click_button "Dodaj włókno"
    expect(page).to have_content "Błąd! Włókno istnieje!"
  end

  scenario 'search' do
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
    visit fibres_new_path
    fill_in "Nr włókna", :with => "1"
    select("111", from: "fibre_name")
    select("A1", from: "fibre_location")
    fill_in "Półka", :with => "1"
    fill_in "Nazwa systemu", :with => "AG"
    fill_in "Nazwa szafy", :with => "PS1"
    fill_in "Pomieszczenie", :with => "401"
    click_button "Dodaj włókno"
    visit fibres_path
    select("111", from: "name")
    select("A1", from: "location")
    click_button "Szukaj"
    expect(page).to have_content "Wyniki wyszukiwania"
  end
end
