require 'spec_helper'

describe ScrumPlanner::Iteration, type: :model do
  after(:each) { Timecop.return }

  describe '#initialize' do
    context 'when :length is invalid' do
      it 'raises an exception' do

        expect {
          described_class.new(real_start: Time.now,
                              length:     'hi',
                              today:      Time.now)
        }.to raise_error(ArgumentError, ':length must be positive value')
      end
    end
  end
end