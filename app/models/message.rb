class Message < ApplicationRecord
  has_one :author
  has_one :receiver

end
