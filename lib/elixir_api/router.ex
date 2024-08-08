defmodule ElixirApi.Router do
  # usando modulo Plug.Router neste escopo do projeto
  use Plug.Router

  # usando o modulo Logger de Plug para registrar logs
  plug(Plug.Logger)

  # Faz match das requisições recebidas com os endpoints
  # definidos em nosso projeto.
  plug(:match)

  # Trata a requisição recebida como JSON
  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason)
  plug(:dispatch)

  # Endpoint para retornar uma mensagem de boas-vindas
  get "/" do
    send_resp(conn, 200, "Hello World!")
  end

  get "/hello/:name" do
    send_resp(conn, 200, "Hello #{name}")
  end

  match _ do
    send_resp(conn, 404, "Not Found!")
  end
end
