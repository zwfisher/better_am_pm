require 'spec_helper'

describe ActionView::Helpers::DateTimeSelector do

  it 'has TWELVE_HOUR_TRANSLATIONS constant' do
    expect(ActionView::Helpers::DateTimeSelector::TWELVE_HOUR_TRANSLATION.class).to eq Hash
  end

  describe '#select_hour' do
    context 'called with normal options' do
      # FIXME: This initialization fails in test context without the original ActionView::Helpers::DateTimeSelector
      let (:selector) { ActionView::Helpers::DateTimeSelector.new(Time.now).select_hour.split("\n") }

      it 'returns a select with options numbered 0..23' do
        expect(selector.length).to eq 26 # 24 hours and open/close select tags
        expect(selector[1]).to eq '<option value=\"00\">00</option>'
        expect(selector[24]).to eq '<option value=\"23\">23</option>'
      end
    end

    context 'called with twelve_hour: true' do
      let (:selector) { ActionView::Helpers::DateTimeSelector.new(Time.now, twelve_hour: true).select_hour.split("\n") }

      it 'returns a select with two optgroups' do
        expect(selector.length).to eq 28 # 24 hours, open/close select tags, two close optgroup tags
        expect(selector[1]).to match(/^<optgroup label=\\"am\\">/)
        expect(selector[13]).to eq '</optgroup>'
        expect(selector[14]).to match(/^<optgroup label=\\"pm\\">/)
        expect(selector[26]).to eq '</optgroup>'
      end

      it 'numbers the options 12-11 in both optgroups' do
        expect(selector[1]).to match(/<option value=\\"00\\">12<\/option>/)
        expect(selector[12]).to eq '<option value=\"11\">11</option>'
        expect(selector[15]).to eq '<option value=\"13\">01</option>'
        expect(selector[25]).to eq '<option value=\"23\">11</option>'
      end
    end
  end
end