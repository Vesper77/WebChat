class Sleeper
  @queue = :sleep

  def self.perform(author, number)
    number.times do
      sleep(5)

      message = Message.new({
                              author: 5,
                              receiver: author,
                              text: "Bot triggered!"
                          })
    message.save


  end

  end
end
