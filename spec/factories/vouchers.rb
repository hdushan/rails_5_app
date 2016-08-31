FactoryGirl.define do
  factory :voucher do
    code 'MyString'
    product 'MyString'
    voucher_type ''
    expiry_date '2016-08-13'
    value 1.5
    notes 'MyString'
    environment nil
  end
end
