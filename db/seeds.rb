# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Link.delete_all

Category.create!(title: 'miscellaneous', id: '1', url: 'miscellaneous')

Link.create!(title: 'postgre', description: 'postgre', address: 'http://google.com', approved: true, user_id: nil, category_id: '1')
Link.create!(title: 'html', description: 'html and css', address: 'http://google.com', approved: true, user_id: nil, category_id: '1')
Link.create!(title: 'ruby', description: 'best lang', address: 'http://google.com', approved: true, user_id: nil, category_id: '1')
Link.create!(title: 'ascii', description: 'art', address: 'http://google.com', approved: true, user_id: nil, category_id: '1')
Link.create!(title: 'rspec', description: 'testing ruby code', address: 'http://google.com', approved: true, user_id: nil, category_id: '1')
Link.create!(title: '42', description: '42', address: 'http://google.com', approved: true, user_id: nil, category_id: '1')