require "rufus-scheduler"

scheduler = Rufus::Scheduler.new

scheduler.cron("0 4 * * *") do # At 4 a.m. every day
  puts "Start rake"
	`rake "import_files:call"`
  puts "Finish rake"
end
