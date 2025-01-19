require 'test_helper'

class ConcernsTest < ActiveSupport::TestCase
  def setup
    @test_model = TestConcernModel.new
  end

  test 'cacheable concern works' do
    @test_model.store_in_cache(:test, '123', { data: 'test' })
    cached_data = @test_model.fetch_from_cache(:test, '123')
    assert_equal({ data: 'test' }, cached_data)
  end

  test 'loggable concern works' do
    assert_nothing_raised do
      @test_model.log_start(:test_operation, '123')
      @test_model.log_success(:test_operation, '123')
    end
  end

  test 'metrics handling concern works' do
    assert_raises(NotImplementedError) do
      @test_model.test_metrics_handling
    end
  end

  test 'channel analysis concern works' do
    assert_raises(NotImplementedError) do
      @test_model.test_channel_analysis
    end
  end

  test 'visualization handling concern works' do
    visualization = @test_model.test_visualization
    assert_equal :time_series, visualization[:type]
    assert_equal 'Time', visualization[:metadata][:x_axis]
  end
end