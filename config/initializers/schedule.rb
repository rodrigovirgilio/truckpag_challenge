require "rufus-scheduler"

scheduler = Rufus::Scheduler.new

scheduler.cron("0 4 * * *") do # At 04:00am
  puts "Exec rake"
	`rake "import_files:call"`
  puts "Finish rake"
end
