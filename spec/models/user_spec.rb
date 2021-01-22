require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    # it 'Ensures first name presence' do
    #    user = User.new(last_name: 'Last', email: 'sample@email.com').save
    #    expect(user).to eq(false)
    # end

    # it 'Ensures last name presence' do
    #    user = User.new(first_name: 'First', email: 'sample@email.com').save
    #    expect(user).to eq(false)
    # end

    # it 'Ensures email presence' do
    #   user = User.new(first_name: 'First', last_name: 'Last').save
    #    expect(user).to eq(false)
    # end

    it 'should save successfully' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'sample@email.com').save
      expect(user).to eq(true)
    end
  end

  context 'Scope tests' do
  end
end
