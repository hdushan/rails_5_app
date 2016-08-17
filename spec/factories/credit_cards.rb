FactoryGirl.define do
  factory :credit_card do
    card_number 'MyString'
    card_type 'MyString'
    name 'MyString'
    cvv 'MyString'
    expiry_date '2016-08-17'
    crn 'MyString'
    environment nil
    notes 'MyString'
    return_code 'MyString'
  end
end
