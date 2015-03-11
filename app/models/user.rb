class User < ActiveRecord::Base

    self.table_name = 'User'
    self.primary_key = :UserId

    before_save :encrypt_password

    belongs_to :employee, :class_name => 'Employee', :foreign_key => :EmployeeId

    def encrypt_password
      if self.Password.present?
        BCrypt::Engine.cost = 13
        self.Password = BCrypt::Password.create(self.Password.to_s)
      end
    end
end
