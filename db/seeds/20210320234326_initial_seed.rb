# frozen_string_literal: true

Sequel.seed(:development, :test) do
  def run
    user = User.create \
      name: 'Bob',
      email: 'bob@example.com',
      password: 'givemeatoken'

    UserSession.create \
      uuid: 'uuid',
      user_id: user.id
  end
end
