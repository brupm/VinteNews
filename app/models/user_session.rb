class UserSession < Authlogic::Session::Base
  generalize_credentials_error_messages true
  
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
end