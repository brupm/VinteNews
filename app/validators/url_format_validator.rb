# encoding: utf-8
class UrlFormatValidator < ActiveModel::EachValidator  
  def validate_each(object, attribute, value)  
    unless value =~ /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
      object.errors[attribute] << (options[:message] || I18n.t('validators.url'))  
    end  
  end  
end