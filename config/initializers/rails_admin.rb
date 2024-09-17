RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # Hide the Email model completely from the Rails Admin dashboard
  config.excluded_models << "Email"
  config.excluded_models << "EmailBlast"
  config.excluded_models << "ActiveStorage::Blob"
  config.excluded_models << "ActiveStorage::Attachment"
  config.excluded_models << "ActiveStorage::VariantRecord"
  config.excluded_models << "ActionMailbox::InboundEmail"
  config.excluded_models << "ActionMailbox::InboundEmail::Routings"

  # Only manage Users and Groups
  config.model "User" do
    list do
      field :name
      field :email
      field :groups # Allow group management for users
    end

    edit do
      field :name
      field :email
      field :groups # Enable group selection
      # Do not include Emails here
    end
  end

  config.model "Group" do
    list do
      field :name
      field :email_address
      field :blast_count do
        label "Blast Count"
        pretty_value do
          bindings[:object].email_blasts.count
        end
      end
    end

    edit do
      field :name
      field :email_address
      field :users # Enable user selection
      # Do not include Emails here
    end
  end



  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
