users_list = [
  ['hans.dushanthakumar@amaysim.com.au', 'AWqasde321']
]

User.delete_all

users_list.each do |email, password|
  User.create(email: email, password: password)
end
