class UserSession < Authlogic::Session::Base
  generalize_credentials_error_messages I18n.t('user_session.validations.bad_credentials')
  
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
end