defmodule Self.AtorTest do
  use Self.DataCase

  alias Self.Ator

  describe "clientes" do
    alias Self.Ator.Cliente

    @valid_attrs %{cpf: "some cpf", data_nascimento: ~D[2010-04-17], email: "some email", nome: "some nome", sexo: 42, telefone: "some telefone"}
    @update_attrs %{cpf: "some updated cpf", data_nascimento: ~D[2011-05-18], email: "some updated email", nome: "some updated nome", sexo: 43, telefone: "some updated telefone"}
    @invalid_attrs %{cpf: nil, data_nascimento: nil, email: nil, nome: nil, sexo: nil, telefone: nil}

    def cliente_fixture(attrs \\ %{}) do
      {:ok, cliente} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ator.create_cliente()

      cliente
    end

    test "list_clientes/0 returns all clientes" do
      cliente = cliente_fixture()
      assert Ator.list_clientes() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Ator.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      assert {:ok, %Cliente{} = cliente} = Ator.create_cliente(@valid_attrs)
      assert cliente.cpf == "some cpf"
      assert cliente.data_nascimento == ~D[2010-04-17]
      assert cliente.email == "some email"
      assert cliente.nome == "some nome"
      assert cliente.sexo == 42
      assert cliente.telefone == "some telefone"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ator.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{} = cliente} = Ator.update_cliente(cliente, @update_attrs)
      assert cliente.cpf == "some updated cpf"
      assert cliente.data_nascimento == ~D[2011-05-18]
      assert cliente.email == "some updated email"
      assert cliente.nome == "some updated nome"
      assert cliente.sexo == 43
      assert cliente.telefone == "some updated telefone"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Ator.update_cliente(cliente, @invalid_attrs)
      assert cliente == Ator.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Ator.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Ator.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Ator.change_cliente(cliente)
    end
  end

  describe "fornecedores" do
    alias Self.Ator.Fornecedor

    @valid_attrs %{cnpj: "some cnpj", email: "some email", inscrica_estadual: "some inscrica_estadual", nome_fantasia: "some nome_fantasia", razao_social: "some razao_social", telefone: "some telefone"}
    @update_attrs %{cnpj: "some updated cnpj", email: "some updated email", inscrica_estadual: "some updated inscrica_estadual", nome_fantasia: "some updated nome_fantasia", razao_social: "some updated razao_social", telefone: "some updated telefone"}
    @invalid_attrs %{cnpj: nil, email: nil, inscrica_estadual: nil, nome_fantasia: nil, razao_social: nil, telefone: nil}

    def fornecedor_fixture(attrs \\ %{}) do
      {:ok, fornecedor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ator.create_fornecedor()

      fornecedor
    end

    test "list_fornecedores/0 returns all fornecedores" do
      fornecedor = fornecedor_fixture()
      assert Ator.list_fornecedores() == [fornecedor]
    end

    test "get_fornecedor!/1 returns the fornecedor with given id" do
      fornecedor = fornecedor_fixture()
      assert Ator.get_fornecedor!(fornecedor.id) == fornecedor
    end

    test "create_fornecedor/1 with valid data creates a fornecedor" do
      assert {:ok, %Fornecedor{} = fornecedor} = Ator.create_fornecedor(@valid_attrs)
      assert fornecedor.cnpj == "some cnpj"
      assert fornecedor.email == "some email"
      assert fornecedor.inscrica_estadual == "some inscrica_estadual"
      assert fornecedor.nome_fantasia == "some nome_fantasia"
      assert fornecedor.razao_social == "some razao_social"
      assert fornecedor.telefone == "some telefone"
    end

    test "create_fornecedor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ator.create_fornecedor(@invalid_attrs)
    end

    test "update_fornecedor/2 with valid data updates the fornecedor" do
      fornecedor = fornecedor_fixture()
      assert {:ok, %Fornecedor{} = fornecedor} = Ator.update_fornecedor(fornecedor, @update_attrs)
      assert fornecedor.cnpj == "some updated cnpj"
      assert fornecedor.email == "some updated email"
      assert fornecedor.inscrica_estadual == "some updated inscrica_estadual"
      assert fornecedor.nome_fantasia == "some updated nome_fantasia"
      assert fornecedor.razao_social == "some updated razao_social"
      assert fornecedor.telefone == "some updated telefone"
    end

    test "update_fornecedor/2 with invalid data returns error changeset" do
      fornecedor = fornecedor_fixture()
      assert {:error, %Ecto.Changeset{}} = Ator.update_fornecedor(fornecedor, @invalid_attrs)
      assert fornecedor == Ator.get_fornecedor!(fornecedor.id)
    end

    test "delete_fornecedor/1 deletes the fornecedor" do
      fornecedor = fornecedor_fixture()
      assert {:ok, %Fornecedor{}} = Ator.delete_fornecedor(fornecedor)
      assert_raise Ecto.NoResultsError, fn -> Ator.get_fornecedor!(fornecedor.id) end
    end

    test "change_fornecedor/1 returns a fornecedor changeset" do
      fornecedor = fornecedor_fixture()
      assert %Ecto.Changeset{} = Ator.change_fornecedor(fornecedor)
    end
  end

  describe "funcionarios" do
    alias Self.Ator.Funcionario

    @valid_attrs %{cpf: "some cpf", data_nascimento: ~D[2010-04-17], email: "some email", nome: "some nome", sexo: 42, telefone: "some telefone"}
    @update_attrs %{cpf: "some updated cpf", data_nascimento: ~D[2011-05-18], email: "some updated email", nome: "some updated nome", sexo: 43, telefone: "some updated telefone"}
    @invalid_attrs %{cpf: nil, data_nascimento: nil, email: nil, nome: nil, sexo: nil, telefone: nil}

    def funcionario_fixture(attrs \\ %{}) do
      {:ok, funcionario} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ator.create_funcionario()

      funcionario
    end

    test "list_funcionarios/0 returns all funcionarios" do
      funcionario = funcionario_fixture()
      assert Ator.list_funcionarios() == [funcionario]
    end

    test "get_funcionario!/1 returns the funcionario with given id" do
      funcionario = funcionario_fixture()
      assert Ator.get_funcionario!(funcionario.id) == funcionario
    end

    test "create_funcionario/1 with valid data creates a funcionario" do
      assert {:ok, %Funcionario{} = funcionario} = Ator.create_funcionario(@valid_attrs)
      assert funcionario.cpf == "some cpf"
      assert funcionario.data_nascimento == ~D[2010-04-17]
      assert funcionario.email == "some email"
      assert funcionario.nome == "some nome"
      assert funcionario.sexo == 42
      assert funcionario.telefone == "some telefone"
    end

    test "create_funcionario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ator.create_funcionario(@invalid_attrs)
    end

    test "update_funcionario/2 with valid data updates the funcionario" do
      funcionario = funcionario_fixture()
      assert {:ok, %Funcionario{} = funcionario} = Ator.update_funcionario(funcionario, @update_attrs)
      assert funcionario.cpf == "some updated cpf"
      assert funcionario.data_nascimento == ~D[2011-05-18]
      assert funcionario.email == "some updated email"
      assert funcionario.nome == "some updated nome"
      assert funcionario.sexo == 43
      assert funcionario.telefone == "some updated telefone"
    end

    test "update_funcionario/2 with invalid data returns error changeset" do
      funcionario = funcionario_fixture()
      assert {:error, %Ecto.Changeset{}} = Ator.update_funcionario(funcionario, @invalid_attrs)
      assert funcionario == Ator.get_funcionario!(funcionario.id)
    end

    test "delete_funcionario/1 deletes the funcionario" do
      funcionario = funcionario_fixture()
      assert {:ok, %Funcionario{}} = Ator.delete_funcionario(funcionario)
      assert_raise Ecto.NoResultsError, fn -> Ator.get_funcionario!(funcionario.id) end
    end

    test "change_funcionario/1 returns a funcionario changeset" do
      funcionario = funcionario_fixture()
      assert %Ecto.Changeset{} = Ator.change_funcionario(funcionario)
    end
  end
end
