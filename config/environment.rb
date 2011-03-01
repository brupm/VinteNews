# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vintenews::Application.initialize!

ActionView::Base.field_error_proc = proc { |input, instance| input }