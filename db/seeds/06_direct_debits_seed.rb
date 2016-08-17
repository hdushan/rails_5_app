direct_debit_list = [
  ['999123', '123123123', Environment.where(name: 'battlefield').first, '']
]

DirectDebit.delete_all

direct_debit_list.each do |bsb, account_number, environment, notes|
  DirectDebit.create(bsb: bsb, account_number: account_number, environment: environment, notes: notes)
end
