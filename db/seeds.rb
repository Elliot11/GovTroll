require 'csv'

file = Rails.root.join('db', 'mp.csv')

CSV.foreach(file, headers: true) do |line|
  contact            = Contact.new
  contact.first_name = line['first_name']
  contact.last_name  = line['last_name']
  contact.email = line['email']
  contact.twitter = line['twitter'].split('/').last unless line['twitter'].nil?
  contact.facebook = line['facebook']
  contact.save
end
