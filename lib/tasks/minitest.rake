require 'rake/testtask'

Rake::TestTask.new(minitest: "db:test:prepare") do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = false
end