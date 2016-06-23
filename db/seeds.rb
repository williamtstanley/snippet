# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Kind.count == 0
  ['C', 'C++', 'C#', 'CSS', 'Dart', 'Elixir', 'ERB', 'Fortran', 'Java', 'HTML', 'JavaScript', 'JSON', 'Lua', 'Markdown', 'Perl', 'Python', 'R', 'Ruby', 'Scheme', 'SQL', 'XML', 'YAML'].each do |k|
    Kind.create title: k
  end
end
