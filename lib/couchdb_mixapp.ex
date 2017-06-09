defmodule CouchdbMixApp.Runner do
  use GenServer

  @doc """
  Start our queue and link it.  This is a helper function
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  @doc """
  GenServer.init/1 callback
  """
  def init(state) do

    IO.puts("Setting couch_log level to warning")

    :couch_log.set_level(:warning)

    {:ok, state}
  end

end
