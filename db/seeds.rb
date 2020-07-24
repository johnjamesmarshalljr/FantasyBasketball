
data = HTTParty.get('http://data.nba.net/10s/prod/v1/2016/players.json')

players = data['league']['standard'].each do |p|
p =  Player.new(firstName: p['firstName'],
     lastName: p['lastName'],
      yearsPro: p['yearsPro'],
       country: p['country'],
        position: p['pos'])
        p.save unless p.position.empty?
end
