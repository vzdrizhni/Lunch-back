class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, length: { in: 3..50 }, uniqueness: true

    before_create :set_admin

    private

    def set_admin
      self.admin = true unless User.exists?
    end
end
