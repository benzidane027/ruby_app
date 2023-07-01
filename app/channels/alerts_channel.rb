class AlertsChannel < ActionCable::Channel
  def subscribed
    stream_from "messages"
  end
end
