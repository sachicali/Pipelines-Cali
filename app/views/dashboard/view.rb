# frozen_string_literal: true

module Dashboard
  # View object for dashboard following Hanami patterns
  # Handles presentation logic and data preparation
  class View
    attr_reader :metrics, :channel_id

    def initialize(metrics:, channel_id:)
      @metrics = metrics
      @channel_id = channel_id
    end

    def metrics_data
      [
        {
          id: 'views',
          title: 'Average Views',
          value: format_number(metrics[:average_views]),
          description: 'Average views per video'
        },
        {
          id: 'growth',
          title: 'Growth Rate',
          value: format_percentage(metrics[:view_growth_rate]),
          description: 'Channel growth over time'
        },
        {
          id: 'engagement',
          title: 'Engagement',
          value: format_percentage(metrics[:engagement_rates][:overall]),
          description: 'Overall engagement rate'
        }
      ]
    end

    private

    def format_number(number)
      return '0' unless number
      number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end

    def format_percentage(value)
      return '0%' unless value
      "#{value}%"
    end
  end
end