class Url < ApplicationRecord
  before_validation :generate_token

private
  def generate_token
    if token.nil?
      self.token = TokenGenerator.generate
    end
  end
end
