# Notas | Elixir

## Funções em Elixir

### públicas

```Elixir
def nomeFuncao do
[

]
end
```

### privadas

```Elixir
defp nomeFuncao do
[

]
end
```

## Modulos

```Elixir
# Nomes de módulos em Elixir seguem o padrão PascalCase
```

```Elixir
defmodule NomeModulo do

end
```

## Arquivos

### application.ex

```Elixir
# neste arquivo encontraremos a função start
# que possui a finalidade de inicialização de nossa aplicação
# dentro desta função encontraremos uma lista chamada children
# onde podemos modificar o código para que possamos configurar nosso servidor HTTP
# ex:
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirApi.Worker.start_link(arg)
      # {ElixirApi.Worker, arg}

      # inicializando servidor HTTP
      {Plug.Cowboy, scheme: :http, plug: ElixirApi.Router, options: [port: 8000]}
    ]

#    # See https://hexdocs.pm/elixir/Supervisor.html
#    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

# Para inicializar o servidor:
  iex -S mix run
```

### mix.exs

```Elixir
# O arquivo `mix.exs` é o coração de um projeto Elixir.
# Ele serve como um manifesto, definindo as configurações básicas e as dependências do projeto

# Estrutura

# * **Módulo:** O arquivo `mix.exs` define um módulo que contém as funções de configuração.
# * **Funções:** As funções mais importantes são:
#  * `def project`: Define informações gerais do projeto, como nome, versão e descrição.
#  * `def application`: Configura a aplicação OTP (Open Telecom Platform), especificando módulos, supervisores e outras opções.
#  * `defp deps`: Lista as dependências externas do projeto, indicando o nome do pacote e a versão desejada.

# Gerenciando dependências

# Para adicionar ou remover dependências, basta editar a função `defp deps` e executar o comando `mix deps.get`. O arquivo `mix.lock` rastreia as versões exatas das dependências instaladas, garantindo a reprodutibilidade do ambiente.

# Onde encontrar pacotes

# A plataforma Hex ([https://hex.pm/packages/](https://hex.pm/packages/)) é o repositório oficial de pacotes Elixir, oferecendo uma vasta gama de bibliotecas e ferramentas para desenvolvimento.

# Exemplo de definição de dependências

defp deps do
  [
    {:phoenix, "~> 1.6"},
    {:postgrex, "~> 0.16"},
    {:jason, "~> 1.2"}
  ]
end
```
