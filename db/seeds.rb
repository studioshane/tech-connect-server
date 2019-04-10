# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def t_or_f 
[true, false].sample
end

def full_name 
  "#{Faker::Name.first_name} #{Faker::Name.last_name}"
end 

100.times do 
  User.create(email: Faker::Internet.email, password: "password")
end 



def generate_technician
    num = 1 
    until num == 50
    day_rate = [200, 225, 250, 255, 260, 275].sample
    Technician.create(user_id: num, name: full_name, email:User.all[num-1].email, phone: Faker::PhoneNumber.cell_phone,  day_rate: day_rate, audio: t_or_f, video: t_or_f, lighting: t_or_f, general: t_or_f)
    num += 1
    end 
end 

def av_company
  company = ["PSAV", "AVC Live", "PSPAV", "Blitz", "Present Communications", "Waters Productions", "Eclipse Presentations", "Metro Broadcast", "Aztec", "Creative Staging", "Dreamtek", "Electrosonic", "First Network", "GEMS", "Icon", "MCL" ].sample
end 


def generate_producer
    num = 50
    until num == 101
    Producer.create(user_id: num, name: full_name, email:User.all[num-1].email, phone: Faker::PhoneNumber.cell_phone, company: av_company)
    num += 1
    end 
end 



def gen_random_num(limit)
    (0..limit).to_a.sample
end

def gen_random_tech
    (1..40).to_a.sample
end

def gen_random_prod
    (50..100).to_a.sample
end


    
def dates
  start_date = DateTime.now.beginning_of_day.advance(hours: 7, days: gen_random_num(60))
  end_date = start_date.advance(hours:12, days: gen_random_num(5))
  [start_date, end_date]
end 





def create_event
num = gen_random_num(1)
date_arr = dates
        company = "#{Faker::Company.name} #{Faker::Company.suffix}"
        venue = ["St. Pancras Renaissance", "Royal Garden Hotel", "Shell Bulding", "ExCel London", "Olympia London", "Barclays 1CP", "Corinthia Hotel", "Glaziers Hall", "Drapers Hall", "Royal Tobacco Dock", "The Brewery", "The Truman Brewery", "Institute of Directors", "Natural History Museum", "The Kia Oval", "The Crystal", "The Savoy", "ETC St. Paul's", "ETC County Hall", "InterContinental 02", "InterContinental Park Lane", "Grosvenor Hotel", "Hilton Metropole", "Hilton Paddington"].sample
        Event.create(producer: Producer.all.sample, venue: venue, start: date_arr[0], end:date_arr[1], techs_required: (1..3).to_a.sample, client: company, title: av_company)
end 




generate_technician 
generate_producer

50.times do
    create_event
end

def add_techs_to_events
    Event.all.each do |event|
        rand(event.techs_required + 1).times do
            event.technicians << Technician.all.sample
        end
    end 

end 

add_techs_to_events


