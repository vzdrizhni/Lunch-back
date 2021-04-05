class User < ApplicationRecord
    has_secure_password

    before_create :set_admin

    private

    def set_admin
      self.admin = true unless User.exists?
    end
end
