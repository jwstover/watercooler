defmodule WatercoolerWeb.HomeLive.Index do
  @moduledoc false

  use WatercoolerWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 0)  

    if connected?(socket) do
      IO.inspect(socket, label: "================== SOCKET\n")
      # expensive db operation
    else
      IO.inspect(label: "================== NOT CONNECTED\n")
    end

    {:ok, socket}
  end

  def handle_event("increment", _, socket) do
    socket = update(socket, :count, &(&1 + 1))
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      WatercoolerWeb.HomeLive.Index

      <.button variant="primary" phx-click="increment">Increment</.button>
      <.button variant="secondary" phx-click="increment">Increment</.button>

      <div>count: {@count}</div>
      <div>elixir: {1 + 1}</div>
    </div>
    """
  end
end
