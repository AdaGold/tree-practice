require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "specs"]
  t.warning = false
  t.verbose = false
  t.test_files = FileList['specs/*_spec.rb']
  puts "Running TestTask"
end

task default: :test do
    puts "Running my Rakefile"
end
