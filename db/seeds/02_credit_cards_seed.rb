battlefield_environment = Environment.where(name: 'battlefield').first

battlefield_credit_cards_list = [
  ['4716529510746089', 'VISA', '', '007', '2019-01-28', '', '201.0000', 'Creation Success. Approved.', battlefield_environment],
  ['4929978798598816', 'VISA', '', '053', '2019-01-28', '', '500.1053', 'Declined', battlefield_environment],
  ['4499297051340869', 'VISA', '', '049', '2019-01-28', '', '500.1049', 'Provider Busy', battlefield_environment],
  ['4539101111292783', 'VISA', '', '050', '2019-01-28', '', '500.1050', 'Provider System Error', battlefield_environment],
  ['4556712317219582', 'VISA', '', '052', '2019-01-28', '', '500.1052', 'Provider Unavailable', battlefield_environment],
  ['5558782195906787', 'MASTERCARD', '', '999', '2019-01-28', '', '201.0000', 'Creation Success. Approved', battlefield_environment],
  ['5217190100000014', 'MASTERCARD', '', '999', '2019-01-28', '', '201.0000', 'No DVS!! Creation Success. Approved', battlefield_environment],
  ['5314977498121598', 'MASTERCARD', '', '065', '2019-01-28', '', '500.1065', 'Stolen Card', battlefield_environment],
  ['5586521016312080', 'MASTERCARD', '', '066', '2019-01-28', '', '500.1066', 'Issuer: Restricted Card', battlefield_environment],
  ['5442638426504348', 'MASTERCARD', '', '088', '2019-01-28', '', '500.1088', 'Requested Function Not Supported', battlefield_environment],
  ['5309741869557021', 'MASTERCARD', '', '093', '2019-01-28', '', '500.1093', 'Exceeds cash withdrawal floor limit.', battlefield_environment],
  ['5183310814167780', 'MASTERCARD', '', '094', '2019-01-28', '', '500.1094', 'Merchant Account not configured.', battlefield_environment],
  ['5229189746768311', 'MASTERCARD', '', '095', '2019-01-28', '', '500.1095', 'Not in compliance with security regulations.', battlefield_environment],
  ['5335849017793485', 'MASTERCARD', '', '097', '2019-01-28', '', '500.1097', 'Pin or Password failure limit reached.', battlefield_environment],
  ['349969279922856', 'AMEX', '', '0005', '2019-01-28', '', '201.0000', 'Creation Success. Approved', battlefield_environment],
  ['344854801429650', 'AMEX', '', '1062', '2019-01-28', '', '500.1062', 'Expired Card', battlefield_environment],
  ['375391896691821', 'AMEX', '', '1070', '2019-01-28', '', '500.1070', 'Issuer: Lost Card', battlefield_environment],
  ['371968000865773', 'AMEX', '', '1049', '2019-01-28', '', '500.1049', 'Provider Busy', battlefield_environment],
  ['377010949368405', 'AMEX', '', '1056', '2019-01-28', '', '500.1056', 'Issuer not Available', battlefield_environment],
  ['375501414847412', 'AMEX', '', '1055', '2019-01-28', '', '500.1055', 'Call Card Centre', battlefield_environment],
  ['374229742711685', 'AMEX', '', '1060', '2019-01-28', '', '500.1060', 'Denied Transaction Type', battlefield_environment],
  ['372721376391547', 'AMEX', '', '2401', '2019-01-28', '', '500.1058', 'Insufficient Funds', battlefield_environment]
]

credit_cards_list = battlefield_credit_cards_list

CreditCard.delete_all

credit_cards_list.each do |card_number, card_type, name, cvv, expiry_date, crn, return_code, notes, environment|
  CreditCard.create(card_number: card_number, card_type: card_type, name: name, cvv: cvv, expiry_date: expiry_date,
                    crn: crn, return_code: return_code, notes: notes, environment: environment)
end
