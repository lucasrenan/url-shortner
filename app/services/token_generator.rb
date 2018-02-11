require 'digest/sha1'
require 'base62-rb'

class TokenGenerator
  TOKEN_SIZE = 7
  MAX_TOKENS = Base62::BASE ** TOKEN_SIZE

  def self.generate(url)
    return nil if url.blank?
    Base62.encode(Digest::SHA1.hexdigest(url).to_i(16) % MAX_TOKENS)
  end
end
