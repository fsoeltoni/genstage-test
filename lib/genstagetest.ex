alias Experimental.GenStage

defmodule Genstagetest do
  @moduledoc """
  Main module for testing Genstage.
  """

  def do_stuff do
    boot()
    enqueue_sample_events()
  end

  @doc """
  Launch EventManager and EventHandler.
  """
  def boot do
    EventManager.start_link()
    EventHandler.start_link()
    EventHandlerTwo.start_link()
    IO.puts "[INFO] Event system online."
  end

  def process!(param \\ "a") do
    EventManager.sync_notify(param)
  end

  @doc """
  Enqueue sample events from range.
  """
  def enqueue_sample_events do
    1..300
    |> Enum.each(fn x -> 
      EventManager.sync_notify(x)
    end)
  end
end
