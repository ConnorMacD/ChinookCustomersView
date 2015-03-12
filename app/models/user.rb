class User < ActiveRecord::Base

    self.table_name = 'User'
    self.primary_key = :userId

    before_save :encrypt_password

    validates_uniqueness_of :username

    belongs_to :employee, :class_name => 'Employee', :foreign_key => :employeeId

    def encrypt_password
      if self.password.present?
        BCrypt::Engine.cost = 13
        self.password_salt = BCrypt::Engine.generate_salt
        self.password = BCrypt::Engine.hash_secret(self.password, self.password_salt)
      end
    end
end
