require 'csv'

def create_new_contact(line)
  contact            = Contact.new
  contact.first_name = line['first_name']
  contact.last_name  = line['last_name']
  contact.email = line['email']
  contact.twitter = line['twitter'].split('/').last unless line['twitter'].nil?
  contact.facebook = line['facebook']
  contact.save
end

file = Rails.root.join('db', 'mp.csv')

CSV.foreach(file, headers: true) do |line|
  create_new_contact(line) unless Contact.where(first_name: line['first_name'], last_name: line['last_name']).size >= 1
end

search = Search.new
representatives = search.get_representatives
senators = search.get_senators

failures = []

representatives.each do |rep|
  contact = Contact.where(first_name: rep.first_name.capitalize, last_name: rep.last_name.capitalize).first
  if contact.nil?
    failures << rep
  else
    contact.person_id = rep.person_id
    contact.save
  end
end

# senators.each do |rep|
#   contact = Contact.where(first_name: rep.first_name.capitalize, last_name: rep.last_name.capitalize).first
#   if contact.nil?
#     failures << rep
#   else
#     contact.person_id = rep.person_id
#     contact.save
#   end
# end

failures.each do |f|
  puts "#{f.last_name}, #{f.first_name}"
end
