class User < ApplicationRecord
  include Validable
  has_secure_password
end
