require 'rails_helper'

feature 'Visitor view premium companies' do
  scenario 'successfully' do
    company = FactoryGirl.create(:company)

    5.times do
      FactoryGirl.create(:job, company: company)
    end

    visit root_path

    click_on company.name

    expect(page).to have_css('h1', text: company.name)
    expect(page).to have_xpath("//img[contains(@src,'estrela')]")
  end

  scenario 'not premium' do
    company = FactoryGirl.create(:company)

    visit root_path

    click_on company.name

    expect(page).to have_css('h1', text: company.name)
    expect(page).not_to have_xpath("//img[contains(@src,'estrela')]")
  end
end
