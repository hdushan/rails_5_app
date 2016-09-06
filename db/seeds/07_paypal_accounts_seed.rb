paypal_accounts_list = [
  ['gary.lai@amaysim.com.au', 'AWqasde321', Environment.where(name: 'production').first, 'Account has credit card and bank is verified, but no funding to make proper purchase.'],
  ['bankUnverifiedNoCC.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'production').first, 'Account with no credit card and also bank is unverified'],
  ['kerry.trieu@amaysim.com.au', 'AWqasde321', Environment.where(name: 'production').first, 'Normal test account that is attached to Perry\'s Credit Card.'],
  ['bankVerified.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Account has credit card and bank is verified'],
  ['bankUnverified.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Account with credit card by bank is unverified'],
  ['Nocc.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Account with no credit card but bank is verified'],
  ['bankUnverifiedNoCC.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Account with no credit card and also bank is unverified'],
  ['paypalTest01@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Read Only – Do Not Modify – Cancelled Billing Agreement with amaysim after setting up the PayPal as a payment method, but otherwise has normal funding source	0468729172'],
  ['restricted.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'First restricted PayPal test account'],
  ['restricted-account-two.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Second restricted PayPal test account'],
  ['restricted-after-purchase.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'Restricted PayPal test account after a successful purchase	0468751413'],
  ['noFundingSource.test@amaysim.com.au', 'AWqasde321', Environment.where(name: 'battlefield').first, 'PayPal test account with no funding source'],
]

paypal_accounts_list.each do |user_name, password, environment, notes|
  PaypalAccount.create(user_name: user_name, password: password, environment: environment, notes: notes)
end
