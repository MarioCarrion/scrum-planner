require 'spec_helper'

describe ScrumPlanner::Iteration, type: :model do
  after(:each) { Timecop.return }

  let(:start) { Time.new(2016, 2, 1, 9, 00, 0, '-04:00') }

  describe 'all attr_accesors' do
    describe '#start' do
      subject {
        described_class.new(start:  start,
                            length: 2,
                            today:  Time.now)
      }

      it 'returns the start parameter' do
        expect(subject.start)
          .to eql Time.new(2016, 2, 1, 0, 00, 0, '-04:00')
      end
    end # describe '#start'

    describe '#today' do
      subject {
        described_class.new(start:  start,
                            length: 2,
                            today:  today)
      }

      let(:today) { Time.new(2016, 2, 12, 9, 00, 0, '-04:00') }

      it 'returns the today parameter' do
        expect(subject.today)
          .to eql Time.new(2016, 2, 12, 0, 00, 0, '-04:00')
      end
    end # describe '#today'

    describe '#length' do
      subject {
        described_class.new(start:  start,
                            length: '2',
                            today:  Time.now)
      }

      it 'returns the length parameter' do
        expect(subject.length).to eql 2
      end
    end # describe '#length'
  end # describe 'all attr_accesors'

  describe 'instance methods' do
    describe '#initialize' do
      context 'when :length is invalid' do
        it 'raises an exception' do
          expect {
            described_class.new(start:  Time.now,
                                length: 'hi',
                                today:  Time.now)
          }.to raise_error(ArgumentError, ':length must be positive value')
        end
      end # context 'when :length is invalid'

      context 'when :start is not Monday' do
        let(:not_monday) { Time.new(2016, 2, 2, 0, 00, 0, '-04:00') }

        it 'raises an exception' do
          expect {
            described_class.new(start:  not_monday,
                                length: 2,
                                today:  start)
          }.to raise_error(ArgumentError, ':start must be a Monday')
        end
      end # context 'when :start is not Monday'

      context ':start must be in the past' do
        let(:before_start) { Time.new(2016, 1, 1, 9, 00, 0, '-04:00') }

        it 'raises an exception' do
          expect {
            described_class.new(start:   start,
                                length:  2,
                                today:   before_start)
          }.to raise_error(ArgumentError, ':start must be in the past')
        end
      end # context ':start must be in the past'
    end # describe '#initialize'

    describe '#end_week?' do
      let(:today) { Time.new(2016, 2, 15, 0, 00, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 3,
                            today:  today)
      }

      it 'returns true' do
        expect(subject).to be_end_week
      end
    end # describe '#end_week?'

    describe '#friday?' do
      before(:each) { Timecop.travel Time.new(2016, 2, 12, 9, 0, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 2,
                            today:  Time.now)
      }

      it 'returns true when today is Friday' do
        expect(subject).to be_friday
      end
    end # describe '#friday?'

    describe '#humanized_name' do
      let(:today) { Time.new(2016, 3, 28, 0, 00, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 4,
                            today:  today)
      }

      it 'returns this iteration\'s humanized name' do
        expect(subject.humanized_name).to eql '2016-03-28'
      end
    end # describe '#humanized_name'

    describe '#iteration_number' do
      let(:today) { Time.new(2016, 2, 20, 0, 00, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 2,
                            today:  today)
      }

      it 'returns this iteration number' do
        expect(subject.iteration_number).to eql 2
      end
    end # describe '#humanized_name'

    describe '#monday?' do
      before(:each) { Timecop.travel Time.new(2016, 2, 8, 9, 0, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 2,
                            today:  Time.now)
      }

      it 'returns true when today is Monday' do
        expect(subject).to be_monday
      end
    end # describe '#monday?'

    describe '#start_week?' do
      let(:today) { Time.new(2016, 2, 22, 0, 00, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 3,
                            today:  today)
      }

      it 'returns true' do
        expect(subject).to be_start_week
      end
    end # describe '#start_week?'

    describe '#week_number' do
      before(:each) { Timecop.travel Time.new(2016, 2, 17, 9, 0, 0, '-04:00') }

      subject {
        described_class.new(start:  start,
                            length: 2,
                            today:  Time.now)
      }

      it 'returns the project\'s week number' do
        expect(subject.week_number).to eql 3
      end
    end # describe '#week_number'
  end # describe 'instance methods'
end
