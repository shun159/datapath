defmodule Datapath.MixProject do
  use Mix.Project

  def project do
    [
      app: :datapath,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Datapath.Application, []}
    ]
  end

  defp deps do
    [
      {:eenum, github: "flowforwarding/eenum", branch: "master"},
      {:gen_socket, github: "travelping/gen_socket", branch: "master"},
      # Code Quality
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      # Document
      {:earmark, "~> 1.3.1", only: :doc, runtime: false},
      {:ex_doc, "~> 0.19", only: :doc, runtime: false}
    ]
  end
end
