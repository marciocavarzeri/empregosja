require 'rails_helper'

feature 'Visitor view jobs by category' do
  scenario 'successfully' do
    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    another_job = FactoryGirl.create(:job, title: 'Dev Java Senior',
                                           location: 'São Paulo',
                                           company: company,
                                           category: category,
                                           description: 'Dev com experiência em Java 8')

    visit root_path

    click_on category.name

    expect(page).to have_css('h1', text: category.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)
  end

  scenario 'and view only the current category jobs' do
    job = FactoryGirl.create(:job)
    category = job.category
    company = job.company

    another_category = FactoryGirl.create(:category, name: 'Analista QA')

    another_job = FactoryGirl.create(:job, title: 'QA Java Senior',
                                     location: 'São Paulo',
                                     company: company,
                                     category: another_category,
                                     description: 'QA com experiência em Java 8')

    visit root_path

    click_on another_category.name

    expect(page).to have_css('h1', text: another_category.name)
    expect(page).to have_content another_job.title
    expect(page).to have_content another_job.location
    expect(page).not_to have_content job.title
  end

  scenario 'view a friendly empty message' do
    category = FactoryGirl.create(:category)

    visit root_path

    click_on category.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
