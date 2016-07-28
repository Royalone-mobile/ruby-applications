require "resque/tasks"

task "resque:setup" => :environment

task :import_cities => :environment do
  	puts "Updating cities"
  	City.import
	City.update_time_diff
  	puts "done."
end	

task :update_feed => :environment do
 
  puts "Updating feed..."
  	#Resque.enqueue(TweetWorker)
  puts "done."
end	