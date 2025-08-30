class PracticeChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream_name
  end


  def foo(data)
    puts data
    broadcast foo: 1
  end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private
    def stream_name
      "practice_#{params[:name]}"
    end

    def broadcast(data)
      ActionCable.server.broadcast stream_name, data
    end
end
