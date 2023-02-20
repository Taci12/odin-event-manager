require 'csv'

def clean_zipcode(zip_code)
  if zip_code.nil?
    '00000'
  elsif zip_code.length < 5
    zip_code.rjust(5, '0')
  elsif zip_code.length > 5 
    zip_code[0..4]
  end
end

puts 'Event Manager Initialized'

contents = CSV.open(
  '../event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
end
