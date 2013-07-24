require 'spec_helper'

describe "qr_codes/index" do
  before(:each) do
    assign(:qr_codes, [
      stub_model(QrCode,
        :qrcode => "Qrcode",
        :status => "Status"
      ),
      stub_model(QrCode,
        :qrcode => "Qrcode",
        :status => "Status"
      )
    ])
  end

  it "renders a list of qr_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Qrcode".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
