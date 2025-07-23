defmodule WatercoolerWeb.HomeLive.Index do
  @moduledoc false

  use WatercoolerWeb, :live_view

  on_mount {WatercoolerWeb.LiveUserAuth, :live_user_optional}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_user={@current_user}>
      <pre>
      Add a button to go to /chat.
      You'll need to be logged in to do that. 
      Login button -> click sign in -> go to /dev/mailbox & click link
      </pre>
    </Layouts.app>
    """
  end
end
