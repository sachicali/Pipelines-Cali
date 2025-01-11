namespace :pipeline do
  desc "Process a YouTube channel"
  task :analyze, [:channel_id] => :environment do |t, args|
    if args.channel_id
      puts "Starting analysis for channel: #{args.channel_id}"
      Pipeline::Workers::ChannelAnalysisWorker.perform_async(args.channel_id)
    else
      puts "Please provide a channel ID"
      puts "Usage: rake pipeline:analyze[channel_id]"
    end
  end
  
  desc "Clear cached data for a channel"
  task :clear_cache, [:channel_id] => :environment do |t, args|
    if args.channel_id
      cache = Pipeline::Services::CacheService.new
      cache.clear(:analysis, args.channel_id)
      cache.clear(:recommendations, args.channel_id)
      puts "Cleared cache for channel: #{args.channel_id}"
    else
      puts "Please provide a channel ID"
      puts "Usage: rake pipeline:clear_cache[channel_id]"
    end
  end
  
  desc "Generate report for a channel"
  task :report, [:channel_id] => :environment do |t, args|
    if args.channel_id
      report = Pipeline::Report.new(args.channel_id)
      report.generate
      puts "Report generated: #{report.path}"
    else
      puts "Please provide a channel ID"
      puts "Usage: rake pipeline:report[channel_id]"
    end
  end
end 