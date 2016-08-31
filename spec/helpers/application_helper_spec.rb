require 'rails_helper'

include ApplicationHelper

RSpec.describe '#alert_class_for' do
  it 'sucess as a string' do
    expect(alert_class_for('success')).to eq('alert-success')
  end

  it 'sucess as a symbol' do
    expect(alert_class_for(:success)).to eq('alert-success')
  end
end
