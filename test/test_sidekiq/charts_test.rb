# frozen_string_literal: true

require 'minitest_helper'

module Sidekiq
  module Statistic
    describe 'Charts' do
      before { Sidekiq.redis(&:flushdb) }

      let(:chart) { Sidekiq::Statistic::Charts.new(1) }

      describe '#dates' do
        it 'returns array with all days' do
          days = chart.dates
          assert_equal Time.now.utc.to_date.to_s, days.last
        end
      end

      describe '#color' do
        it 'returns rgb color for worker' do
          assert_equal '102,63,243', chart.color_for('HistoryWorker')
        end
      end
    end
  end
end
