# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

config :kernel, error_logger: :silent

config :sasl, sasl_error_logger: false

config :config, ini_files: [
    # "./config/etc" |> String.to_charlist,
    "./config/etc/default.ini" |> String.to_charlist,
    "./config/etc/local.ini" |> String.to_charlist,
  ]

config :couch_epi, plugins: [
      :couch_db_epi,
      :chttpd_epi,
      :couch_index_epi,
      :global_changes_epi,
      :mango_epi,
      :mem3_epi
      # :setup_epi
    ]

config :logger,
  level: :debug
  # handle_otp_reports: true,
  # handle_sasl_reports: true

# config :couch,
#   package_author_name: "The Apache Software Foundation",
#   prefix: ".",
#   data_dir: "./data",
#   view_index_dir: "./data",
#   log_file: "",
#   fauxton_root: "./share/www",
#   user: "ROOT",
#   node_name: "-name couchdb@localhost",
#   cluster_port: 5984,
#   backend_port: 5986



# You can configure for your application as:
#
#     config :couchdb_mixapp, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:couchdb_mixapp, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
