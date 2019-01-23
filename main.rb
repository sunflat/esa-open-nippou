Bundler.require
require 'date'

Dotenv.load

distance = ARGV[0] ? ARGV[0].to_i : 0
current_date = Date.today - distance

query = current_date.strftime('日報/%Y/%m/%d')

client = Esa::Client.new(access_token: ENV['ESA_API_TOKEN'], current_team: ENV['TEAM'])
page = 1
count = 0
loop do
  response = client.posts(q: "in:#{query}", page: page)
  count += response.body['posts'].size
  response.body['posts'].each do |p|
    system %!open "#{p['url']}"!
  end
  page = response.body['next_page']
  break unless page
end
puts "#{count}件の日報がありました"
