# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
