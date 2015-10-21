require 'securerandom'

class OysterCard
  attr_reader :owner_name

  def initialize(uid_generator = SecureRandom, name)
    @uid_generator = uid_generator
    @owner_name = name
  end

  def uuid
    uid_generator.uuid
  end

  private 

  attr_reader :uid_generator
end
