require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#ldt' do
    subject { helper.ldt time }

    context 'if present' do
      let(:time) { Time.current }
      it { is_expected.to match(/^\d{4}\/\d{2}\/\d{2} \d{2}:\d{2}$/) }
    end

    context 'unless present' do
      let(:time) { nil }
      it { is_expected.to eq '' }
    end
  end
end
