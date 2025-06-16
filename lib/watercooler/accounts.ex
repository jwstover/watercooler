defmodule Watercooler.Accounts do
  use Ash.Domain, otp_app: :watercooler, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource Watercooler.Accounts.Token
    resource Watercooler.Accounts.User
  end
end
