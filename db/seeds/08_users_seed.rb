users_list = [
  ['hans.dushanthakumar@amaysim.com.au', 'AWqasde321', true]
]

users_list.each do |email, password, admin|
  User.create(email: email, password: password, admin: admin)
end
