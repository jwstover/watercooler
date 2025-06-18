defmodule WatercoolerWeb.HomeLive.Index do
  @moduledoc false

  use WatercoolerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      WatercoolerWeb.HomeLive.Index
    </div>
    """
  end
end
