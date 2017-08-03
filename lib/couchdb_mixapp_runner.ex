defmodule CouchdbMixApp.Runner do
  require Logger
  use GenServer

  @couch_apps_list Mix.Project.config[:couch_apps_list]


  def start_applications() do
    GenServer.cast(__MODULE__, :start)
  end

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


    # IO.puts("Setting couch_log level to warning")
    # :couch_log.set_level(:warning)

    {:ok, state}
  end


  def handle_cast(:start, state) do

    Logger.debug("CouchApp Lists: #{inspect @couch_apps_list}")

    for app <- @couch_apps_list do
      Logger.debug("CouchApp.Runner starting: #{inspect app}")
      Application.ensure_all_started(app)
    end

    {:noreply, state}
  end
end
