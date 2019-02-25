FactoryBot.define do
  factory :advice do
    sequence :body { |n| "If You Attempt to Rob a Bank, You Will Have No Trouble with Rent or Bills for the Next Ten Years, Whether You Are Successful or Not.#{n}" }
    user
  end
end
