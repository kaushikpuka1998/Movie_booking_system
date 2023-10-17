FactoryBot.define do
  factory :show_seat do
    show { nil }
    cinema_seat { nil }
    booked { false }
  end
end
