class Sleeper
  @queue = :sleep

  def self.perform(args)
    args[:number].times do
      sleep(5)

      message = Message.new({
                              author: 5,
                              receiver: args[:author],
                              text: "Bot triggered!"
                          })
    message.save


  end

  end
end
