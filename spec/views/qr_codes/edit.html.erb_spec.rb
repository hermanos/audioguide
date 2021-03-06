require 'spec_helper'

describe "qr_codes/edit" do
  before(:each) do
    @qr_code = assign(:qr_code, stub_model(QrCode,
      :qrcode => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit qr_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", qr_code_path(@qr_code), "post" do
      assert_select "input#qr_code_qrcode[name=?]", "qr_code[qrcode]"
      assert_select "input#qr_code_status[name=?]", "qr_code[status]"
    end
  end
end
