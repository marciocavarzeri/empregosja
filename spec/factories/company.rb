FactoryGirl.define do
  factory :company, class: Company do
    to_create(&:save)

    name 'Campus Code'
    location 'São Paulo'
    phone '11 2369 3476'
    mail 'contato@campuscode.com.br'
  end
end
