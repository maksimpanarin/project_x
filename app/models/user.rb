# frozen_string_literal: true

# Schema information

# Table name: users

# id         :integer      not null, primary key
# first_name :string
# last_name  :string
# email      :string
# active     :boolean      default: true
# created_at :datetime     not null
# updated_at :datetime     not null

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
