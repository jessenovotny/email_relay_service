class ApplicationMailbox < ActionMailbox::Base
  routing /.+@.+/i => :group_mailbox
end
