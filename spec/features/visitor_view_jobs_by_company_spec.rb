require 'rails_helper'

feature 'Visitor view jobs by company' do
  scenario 'successfully' do
    category_ux = FactoryGirl.create(:category, name: 'UX')

    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    another_job = FactoryGirl.create(:job, title: 'UX Senior',
                             location: 'São Paulo',
                             company: company,
                             category: category_ux,
                             description: 'UX com experiência em redes sociais')

    visit root_path

    click_on company.name

    expect(page).to have_css('h1', text: company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(category.name)

    expect(page).to have_content(another_job.title)
    expect(page).to have_content(category_ux.name)
  end

  scenario 'and view only the company jobs' do
    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    another_company = FactoryGirl.create(:company, name: 'Google',
                                         location: 'São Paulo',
                                         mail: 'google@gmail.com.br',
                                         phone: '4444-8888')
    visit root_path

    click_on another_company.name

    expect(page).to have_css('h1', text: another_company.name)
    expect(page).not_to have_content(job.title)
    expect(page).not_to have_content(job.category.name)
  end


  scenario 'view a friendly message' do
    company = FactoryGirl.create(:company)

    visit root_path

    click_on company.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
