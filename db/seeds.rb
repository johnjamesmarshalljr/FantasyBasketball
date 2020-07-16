# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data = HTTParty.get('http://data.nba.net/10s/prod/v1/2016/players.json')


players = data['league']['standard'].each do |p|
  Player.create(firstName: p['firstName'],
     lastName: p['lastName'],
      yearsPro: p['yearsPro'],
       country: p['country'],
        position: p['pos'])
end
