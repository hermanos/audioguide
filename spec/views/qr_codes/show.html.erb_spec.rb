require 'spec_helper'

describe "qr_codes/show" do
  before(:each) do
    @qr_code = assign(:qr_code, stub_model(QrCode,
      :qrcode => "Qrcode",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Qrcode/)
    rendered.should match(/Status/)
  end
end
