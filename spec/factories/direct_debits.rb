FactoryGirl.define do
  factory :direct_debit do
    bsb 'MyString'
    account_number 'MyString'
    environment nil
    notes 'MyString'
  end
end
