class AlertsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
    ActionCable.server.broadcast("messages", { "hello" => "hi hi" })
    puts "**** welcome ****"
  end

  def unsubscribed
    puts "**** bye bye ****"
  end

  def receivfy(data)
    puts "this is data -----------------\n"
    puts data
    #ActionCable.server.broadcast("messages", { "hello" => "hi hi" })
  end
end
