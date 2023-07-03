class AlertsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
    puts "**** welcome ****"
  end

  def unsubscribed
    puts "**** bye bye ****"
  end

  def receive(data)
    puts "this is data -----------------\n"
    puts data
    #ActionCable.server.broadcast("messages", { "hello" => "hi hi" })
  end
end
