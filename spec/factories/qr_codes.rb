# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qr_code do
    qrcode "MyString"
    status "MyString"
  end
end
