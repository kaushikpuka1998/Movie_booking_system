module Validable
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
  end
end
