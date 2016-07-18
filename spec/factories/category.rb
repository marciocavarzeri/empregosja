FactoryGirl.define do
  factory :category, class: Category do
    to_create(&:save)

    name 'Desenvolvedor'
  end
end
