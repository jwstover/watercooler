defmodule Watercooler.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        Watercooler.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:watercooler, :token_signing_secret)
  end
end
