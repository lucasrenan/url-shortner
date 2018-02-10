require 'securerandom'

class TokenGenerator
  BASE = 4

  def self.generate(_url = nil)
    SecureRandom.hex(BASE)
  end
end
