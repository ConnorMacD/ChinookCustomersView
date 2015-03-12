class Customer < ActiveRecord::Base
    self.table_name = 'Customer'
    self.primary_key = :CustomerId

    validates :FirstName, :LastName, :Address, :City, :Country, :Email, presence: true
    validates :Email, :format => { :with => /[@]{1}/, message: 'enter a valid email'}
    validates :FirstName, :format => { :with => /\A[A-Z]{1}/, message: 'First name must start with a capital'}
    validates :LastName, :format => { :with => /\A[A-Z]{1}/, message: 'Last name must start with a capital'}

    belongs_to :employee, :class_name => 'Employee', :foreign_key => :SupportRepId
    has_many :invoices, :class_name => 'Invoice', :foreign_key => :CustomerId

    def name
      "#{self.FirstName} #{self.LastName}"
    end
end
