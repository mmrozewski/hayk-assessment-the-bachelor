require 'pry'

peeps = {
  "season 19":[
     {
        "name":"Ashley Iaconetti",
        "age":"26",
        "hometown":"Great Falls, Virginia",
        "occupation":"Nanny/Freelance Journalist",
        "status":""
     },
     {
        "name":"Becca Tilley",
        "age":"26",
        "hometown":"Shreveport, Louisiana[b]",
        "occupation":"Chiropractic Assistant",
        "status":""
     },
     {
        "name":"Britt Nilsson",
        "age":"27",
        "hometown":"Hollywood, California",
        "occupation":"Waitress",
        "status":""
     },
     {
        "name":"Carly Waddell",
        "age":"29",
        "hometown":"Arlington, Texas",
        "occupation":"Cruise Ship Singer",
        "status":""
     },
     {
        "name":"Jade Roper",
        "age":"28",
        "hometown":"Los Angeles, California",
        "occupation":"Cosmetics Developer",
        "status":""
     }
    ]
  }

def all_contestants(data)
  data.values.flatten
end

def all_hometowns(data)
  all_contestants(data).map do |contestant|
    contestant["hometown"]
  end
end

# def all_ages_season(data, season)
#   data.flatten[season].map do |contestant|
#     contestant["age"].to_i
#   end
# end



def get_first_name_of_season_winner(data, season)
  data[season].find do |contestant|
    contestant["status"] == "Winner"
  end["name"].partition(" ").first
end

def get_contestant_name(data, occupation)
  all_contestants(data).find do |contestant|
    contestant["occupation"] == occupation
  end["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_hometowns(data).count(hometown)
end

def get_occupation(data, hometown)
  all_contestants(data).find do |contestant|
    contestant["hometown"] == hometown
  end["occupation"]
end

def get_average_age_for_season(data, season)
  arr_ages = data[season].map do |contestant|
    contestant["age"].to_i
  end
  sum_ages = arr_ages.reduce(0) do |sum, num|
    sum + num
  end
  (sum_ages.to_f / arr_ages.size).round
end

