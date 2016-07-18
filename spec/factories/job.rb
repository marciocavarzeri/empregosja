FactoryGirl.define do
  factory :job, class: Job do
    to_create(&:save)

    title 'Dev Master Rails'
    description 'Vaga para Dev Master para Bootcamp Rails'
    location 'São Paulo - SP'
    featured false
    category
    company
  end
end
