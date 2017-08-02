defmodule CouchdbMixapp.Mixfile do
  use Mix.Project

  def project do
    [app: :couchdb_mixapp,
     version: "0.2.0",
     elixir: "~> 1.4",
    #  compilers: [:elixir_make] ++ Mix.compilers,
    #  make_clean: ["clean"],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     couch_apps_list: @couch_apps_list,
     deps: deps()]
  end

  @couch_apps_list  [
          :bear,
          :chttpd,
          :config,
          :couch,
          :couch_epi,
          :couch_index,
          :couch_log,
          :couch_mrview,
          :couch_plugins,
          :couch_replicator,
          :couch_stats,
          :couch_event,
          :couch_peruser,
          :ddoc_cache,
          :ets_lru,
          :fabric,
          :folsom,
          :global_changes,
          :ibrowse,
          :ioq,
          :jiffy,
          :khash,
          :mango,
          :mem3,
          :mochiweb,
          :oauth,
          :rexi,
          :setup,
          :snappy
        ]

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [mod: {CouchdbMixApp.Application, []},
     extra_applications: [
       :logger,
       :asn1,
       :compiler,
       :crypto,
       :inets,
       :kernel,
       :os_mon,
       :runtime_tools,
       :sasl,
       :ssl,
       :stdlib,
       :syntax_tools,
       :xmerl,
       :b64url,
     ],
     included_applications: @couch_apps_list,

    ]]
  end

  defp deps do
    [
      {:poison, "~> 3.0"},
      # {:setup_epi, "~> 0.3.0"},
      # {:mix_eunit, "~> 0.3.0"},
      # {:elixir_make, "~> 0.4", runtime: false},
      {:setup, github: "uwiger/setup", manager: :rebar, override: true},
      # {:couchdb, github: "apache/couchdb", tag: "2.0.0"},
      {:docs, github: "apache/couchdb-documentation", ref: "8f0c98a7ade8ed50f8b5320410afbbdcc2be1127", compile: false,
          app: false, manager: :rebar, override: true},
      {:fauxton, github: "apache/couchdb-fauxton", tag: "v1.1.11", app: false, manager: :rebar, override: true},
      # {:couch, github: "elcritch/couchdb-couch", branch: "2.0.x-embedded", manager: :rebar, override: true},
      # {:couchdb, github: "apache/couchdb", branch: "2.1.x", manager: :rebar, app: false},
      {:couchdb, github: "elcritch/couchdb-embedded", branch: "2.1.x-nocouchjs", manager: :rebar, app: false},
      # {:couchdb, github: "elcritch/couchdb-embedded", tag: "2.0.0", manager: :rebar, app: false},
      {:couchex, "~> 0.8.1", github: "ringling/couchex"},
    ]
  end

  defp package do
  # These are the default files included in the package
  [
    name: :couchdb_mixapp,
    files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
    maintainers: ["Jaremy Creechley"],
    licenses: ["Apache 2.0"],
    links: %{"GitHub" => "https://github.com/elcritch/couchdb_mixapp"}
  ]
end

end
