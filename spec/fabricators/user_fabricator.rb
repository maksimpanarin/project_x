# frozen_string_literal: true

require 'faker'

Fabricator(:user) do
  # name { Faker::Name.name }
  email { Faker::Internet.email }
  password { 'secret' }
end
