Bundler.require
Dotenv.load

distance = ARGV[0] ? ARGV[0].to_i : 0
current_date = Date.today - distance

query = current_date.strftime('日報/%Y/%m/%d')

client = Esa::Client.new(access_token: ENV['ESA_API_TOKEN'], current_team: ENV['TEAM'])
response = client.posts(q: "in:#{query}")
response.body['posts'].each do |p|
  system %!open "#{p['url']}"!
end
