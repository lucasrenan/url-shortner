class Url < ApplicationRecord
  validates :original_url, presence: true

  before_validation :generate_token

private
  def generate_token
    if token.nil?
      self.token = TokenGenerator.generate(original_url)
    end
  end
end
