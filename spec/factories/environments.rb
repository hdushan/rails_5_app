FactoryGirl.define do
  factory :environment do
    name 'ENV_NAME'
    url 'https://env_name'
    is_prod_data false
  end
end
