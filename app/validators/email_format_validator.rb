# encoding: utf-8
class EmailFormatValidator < ActiveModel::EachValidator  
  def validate_each(object, attribute, value)  
    unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i  
      object.errors[attribute] << (options[:message] || I18n.t('validators.email'))  
    end  
  end  
end