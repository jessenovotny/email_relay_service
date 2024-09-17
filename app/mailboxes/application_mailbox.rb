class ApplicationMailbox < ActionMailbox::Base
  routing /.+@.+/i => :group
end
