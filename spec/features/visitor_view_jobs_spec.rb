require 'rails_helper'

feature 'Visitor view jobs on home page' do
  scenario 'successfully' do
    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    visit root_path

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.location)
    expect(page).not_to have_content('Destaque')
  end

  scenario 'and view a list of jobs' do
    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    another_job = FactoryGirl.create(:job, title: 'UX Senior',
                                     company: company,
                                     category: category,
                                     description: 'UX com experiência em redes sociais',
                                     location: 'São Paulo',
                                     featured: true)
    visit root_path

    expect(page).to have_css('div',text: job.title)
    expect(page).to have_content(job.company.name)
    expect(page).not_to have_content(job.description)
    expect(page).to have_css('div',text: another_job.title)
    expect(page).to have_content(another_job.company.name)
    expect(page).to have_css('strong', text: 'Destaque')
    expect(page).not_to have_content(another_job.description)
  end
end
