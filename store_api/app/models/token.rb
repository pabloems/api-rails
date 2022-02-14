class Token < ApplicationRecord
  belongs_to :user
  validates :token, :user_id, :expires_at, presence: true

  # callback
  after_initialize :generate_access_token

  private

  def generate_access_token
    # se ejecuta una y otra vez 
    # hasta que se rompa el código
    loop do
      self.token = SecureRandom.hex
      # se ejecuta hasta que exista un token en la db
      break unless Token.where(token: token).any?
    end
    # el token expirará en 2 hrs 
    self.expires_at ||= 2.hours.from_now
  end

end
