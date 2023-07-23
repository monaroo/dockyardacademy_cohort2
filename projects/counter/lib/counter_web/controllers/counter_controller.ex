defmodule CounterWeb.CounterController do
  use CounterWeb, :controller

  def home(conn, params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :count, count: params["count"] || "0")
  end

  def increment(conn, params) do
    current = params["count"]
    increment_by = params["increment_by"]

    {current, increment_by} =
    case {is_integer(current), is_integer(increment_by)} do
      {true, true} -> {current, increment_by}
      {false, true} -> {String.to_integer(current), increment_by}
      {true, false} -> {current, String.to_integer(increment_by)}
      {false, false} -> {String.to_integer(current), String.to_integer(increment_by)}
    end

    render(conn, :count, count: "#{current + increment_by}")
  end
end
