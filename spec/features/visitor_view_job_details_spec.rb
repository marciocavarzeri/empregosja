require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    job = FactoryGirl.create(:job, title: 'Vaga de Dev')
    category = job.category
    company = job.company

    visit root_path

    click_on 'Vaga de Dev'

    expect(page).to have_content job.title
    expect(page).to have_content category.name
    expect(page).to have_content job.company.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end

  scenario 'and return to home' do
    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    visit job_path(job)

    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end
end
