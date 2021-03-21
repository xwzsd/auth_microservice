# frozen_string_literal: true

Sequel.seed(:development, :test) do
  require_relative '../../config/environment'

  def run
    user = ::User.create \
      name: 'Bob',
      email: 'bob@example.com',
      password: 'givemeatoken'

    ::UserSession.create \
      uuid: 'ccbb63c0-a8cd-47b7-8445-5d85e9c80977',
      user_id: user.id
  end
end
