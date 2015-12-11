namespace :db do
  desc "Generate Sample data for application"
  task :remake_data => :environment do
    puts "Generate 30 books"
    30.times{FactoryGirl.create :book}
  end
end