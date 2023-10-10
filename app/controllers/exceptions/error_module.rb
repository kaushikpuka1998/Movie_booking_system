module ErrorModule
  class PasswordMismatchedError < StandardError
    def initialize(msg = 'Password MisMatched')
      super
    end
  end

  class AlreadyEmailTakenError < StandardError
    def initialize(msg = 'Email is already taken')
      super
    end
  end

  class AlreadyPhoneTakenError < StandardError
    def initialize(msg = 'Phone is already taken')
      super
    end
  end
end
