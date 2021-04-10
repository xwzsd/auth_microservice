module Auth
  # AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}
  extend self

  def extracted_token
    JwtEncoder.decode(token)
  rescue JWT::DecodeError
    {}
  end

  # private

  # def matched_token
  #   result = auth_header&.match(AUTH_TOKEN)
  #   return if result.blank?

  #   result[:token]
  # end

  # def auth_header
  #   request.env['HTTP_AUTHORIZATION']
  # end
end
