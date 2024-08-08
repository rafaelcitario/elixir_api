defmodule ElixirApiTest do
  use ExUnit.Case, async: true

  # usando o modulo test de Plug.Test para testar as requisições
  use Plug.Test

  # inicializando nosso router e passando para dentro de @opts
  @opts ElixirApi.Router.init([])

  # executando requisicao para o endpoint "/", deverá retornar "Hello World!"
  test "route / return Hello World!" do
    # conn vem de Plug.Test.conn()
    # criando uma conexão teste para a rota "/"
    conn = conn(:get, "/")
    conn = ElixirApi.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello World!"
  end

  test "route /hello/:name return Hello name!" do
    name = "Rafael"
    conn = conn(:get, "/hello/#{name}")
    conn = ElixirApi.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello #{name}"
  end
end
