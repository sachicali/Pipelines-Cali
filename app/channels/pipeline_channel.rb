class PipelineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "pipeline_channel_#{params[:channel_id]}"
  end
  
  def unsubscribed
    stop_all_streams
  end
end 