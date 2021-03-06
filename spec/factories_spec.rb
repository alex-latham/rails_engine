require 'rails_helper'

RSpec.describe "FactoryBot" do
  FactoryBot.factories.map(&:name).each do |factory_name|
    describe "#{factory_name} factory" do
      it 'is valid' do
        expect(build(factory_name)).to be_valid
      end
    end
  end
end