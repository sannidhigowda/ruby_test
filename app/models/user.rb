
   class User < ActiveRecord::Base
     has_secure_password
      validates :email, :presence => true,:uniqueness => true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Not a valid email Address" }
     validates :firstname,:presence=>true
    validates  :lastname,:presence=>true            
     
     validates_length_of :password, :minimum => 8, :allow_blank => true
 
    
    PASSWORD_FORMAT = /\A
 (?=.{8,})          # Must contain 8 or more characters
 (?=.*\d)           # Must contain a digit
 (?=.*[a-z])        # Must contain a lower case character
 (?=.*[A-Z])        # Must contain an upper case character
 (?=.*[[:^alnum:]]) # Must contain a symbol
/x

validates :password, 
 presence: true, 
 
 format: {with: PASSWORD_FORMAT}, 
 # confirmation: true, 
 on: :create
end

