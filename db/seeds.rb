# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

seed_file = File.join(File.dirname(__FILE__), 'seeds.yml')
config = ActiveSupport::HashWithIndifferentAccess[ YAML::load_file(seed_file) ]
config[:projects].each do |project|
    p = Project.new(title: project[:title])
    project[:todos].each do |todo|
        p.todos << Todo.create(todo)
    end
    p.save!
end