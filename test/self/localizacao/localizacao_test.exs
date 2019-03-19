defmodule Self.LocalizacaoTest do
  use Self.DataCase

  alias Self.Localizacao

  describe "paises" do
    alias Self.Localizacao.Pais

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def pais_fixture(attrs \\ %{}) do
      {:ok, pais} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localizacao.create_pais()

      pais
    end

    test "list_paises/0 returns all paises" do
      pais = pais_fixture()
      assert Localizacao.list_paises() == [pais]
    end

    test "get_pais!/1 returns the pais with given id" do
      pais = pais_fixture()
      assert Localizacao.get_pais!(pais.id) == pais
    end

    test "create_pais/1 with valid data creates a pais" do
      assert {:ok, %Pais{} = pais} = Localizacao.create_pais(@valid_attrs)
      assert pais.nome == "some nome"
    end

    test "create_pais/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localizacao.create_pais(@invalid_attrs)
    end

    test "update_pais/2 with valid data updates the pais" do
      pais = pais_fixture()
      assert {:ok, %Pais{} = pais} = Localizacao.update_pais(pais, @update_attrs)
      assert pais.nome == "some updated nome"
    end

    test "update_pais/2 with invalid data returns error changeset" do
      pais = pais_fixture()
      assert {:error, %Ecto.Changeset{}} = Localizacao.update_pais(pais, @invalid_attrs)
      assert pais == Localizacao.get_pais!(pais.id)
    end

    test "delete_pais/1 deletes the pais" do
      pais = pais_fixture()
      assert {:ok, %Pais{}} = Localizacao.delete_pais(pais)
      assert_raise Ecto.NoResultsError, fn -> Localizacao.get_pais!(pais.id) end
    end

    test "change_pais/1 returns a pais changeset" do
      pais = pais_fixture()
      assert %Ecto.Changeset{} = Localizacao.change_pais(pais)
    end
  end

  describe "estados" do
    alias Self.Localizacao.Estado

    @valid_attrs %{nome: "some nome", uf: "some uf"}
    @update_attrs %{nome: "some updated nome", uf: "some updated uf"}
    @invalid_attrs %{nome: nil, uf: nil}

    def estado_fixture(attrs \\ %{}) do
      {:ok, estado} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localizacao.create_estado()

      estado
    end

    test "list_estados/0 returns all estados" do
      estado = estado_fixture()
      assert Localizacao.list_estados() == [estado]
    end

    test "get_estado!/1 returns the estado with given id" do
      estado = estado_fixture()
      assert Localizacao.get_estado!(estado.id) == estado
    end

    test "create_estado/1 with valid data creates a estado" do
      assert {:ok, %Estado{} = estado} = Localizacao.create_estado(@valid_attrs)
      assert estado.nome == "some nome"
      assert estado.uf == "some uf"
    end

    test "create_estado/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localizacao.create_estado(@invalid_attrs)
    end

    test "update_estado/2 with valid data updates the estado" do
      estado = estado_fixture()
      assert {:ok, %Estado{} = estado} = Localizacao.update_estado(estado, @update_attrs)
      assert estado.nome == "some updated nome"
      assert estado.uf == "some updated uf"
    end

    test "update_estado/2 with invalid data returns error changeset" do
      estado = estado_fixture()
      assert {:error, %Ecto.Changeset{}} = Localizacao.update_estado(estado, @invalid_attrs)
      assert estado == Localizacao.get_estado!(estado.id)
    end

    test "delete_estado/1 deletes the estado" do
      estado = estado_fixture()
      assert {:ok, %Estado{}} = Localizacao.delete_estado(estado)
      assert_raise Ecto.NoResultsError, fn -> Localizacao.get_estado!(estado.id) end
    end

    test "change_estado/1 returns a estado changeset" do
      estado = estado_fixture()
      assert %Ecto.Changeset{} = Localizacao.change_estado(estado)
    end
  end

  describe "cidades" do
    alias Self.Localizacao.Cidade

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def cidade_fixture(attrs \\ %{}) do
      {:ok, cidade} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localizacao.create_cidade()

      cidade
    end

    test "list_cidades/0 returns all cidades" do
      cidade = cidade_fixture()
      assert Localizacao.list_cidades() == [cidade]
    end

    test "get_cidade!/1 returns the cidade with given id" do
      cidade = cidade_fixture()
      assert Localizacao.get_cidade!(cidade.id) == cidade
    end

    test "create_cidade/1 with valid data creates a cidade" do
      assert {:ok, %Cidade{} = cidade} = Localizacao.create_cidade(@valid_attrs)
      assert cidade.nome == "some nome"
    end

    test "create_cidade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localizacao.create_cidade(@invalid_attrs)
    end

    test "update_cidade/2 with valid data updates the cidade" do
      cidade = cidade_fixture()
      assert {:ok, %Cidade{} = cidade} = Localizacao.update_cidade(cidade, @update_attrs)
      assert cidade.nome == "some updated nome"
    end

    test "update_cidade/2 with invalid data returns error changeset" do
      cidade = cidade_fixture()
      assert {:error, %Ecto.Changeset{}} = Localizacao.update_cidade(cidade, @invalid_attrs)
      assert cidade == Localizacao.get_cidade!(cidade.id)
    end

    test "delete_cidade/1 deletes the cidade" do
      cidade = cidade_fixture()
      assert {:ok, %Cidade{}} = Localizacao.delete_cidade(cidade)
      assert_raise Ecto.NoResultsError, fn -> Localizacao.get_cidade!(cidade.id) end
    end

    test "change_cidade/1 returns a cidade changeset" do
      cidade = cidade_fixture()
      assert %Ecto.Changeset{} = Localizacao.change_cidade(cidade)
    end
  end

  describe "enderecos" do
    alias Self.Localizacao.Endereco

    @valid_attrs %{bairro: "some bairro", cep: "some cep", logradouro: "some logradouro", numero: "some numero"}
    @update_attrs %{bairro: "some updated bairro", cep: "some updated cep", logradouro: "some updated logradouro", numero: "some updated numero"}
    @invalid_attrs %{bairro: nil, cep: nil, logradouro: nil, numero: nil}

    def endereco_fixture(attrs \\ %{}) do
      {:ok, endereco} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localizacao.create_endereco()

      endereco
    end

    test "list_enderecos/0 returns all enderecos" do
      endereco = endereco_fixture()
      assert Localizacao.list_enderecos() == [endereco]
    end

    test "get_endereco!/1 returns the endereco with given id" do
      endereco = endereco_fixture()
      assert Localizacao.get_endereco!(endereco.id) == endereco
    end

    test "create_endereco/1 with valid data creates a endereco" do
      assert {:ok, %Endereco{} = endereco} = Localizacao.create_endereco(@valid_attrs)
      assert endereco.bairro == "some bairro"
      assert endereco.cep == "some cep"
      assert endereco.logradouro == "some logradouro"
      assert endereco.numero == "some numero"
    end

    test "create_endereco/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localizacao.create_endereco(@invalid_attrs)
    end

    test "update_endereco/2 with valid data updates the endereco" do
      endereco = endereco_fixture()
      assert {:ok, %Endereco{} = endereco} = Localizacao.update_endereco(endereco, @update_attrs)
      assert endereco.bairro == "some updated bairro"
      assert endereco.cep == "some updated cep"
      assert endereco.logradouro == "some updated logradouro"
      assert endereco.numero == "some updated numero"
    end

    test "update_endereco/2 with invalid data returns error changeset" do
      endereco = endereco_fixture()
      assert {:error, %Ecto.Changeset{}} = Localizacao.update_endereco(endereco, @invalid_attrs)
      assert endereco == Localizacao.get_endereco!(endereco.id)
    end

    test "delete_endereco/1 deletes the endereco" do
      endereco = endereco_fixture()
      assert {:ok, %Endereco{}} = Localizacao.delete_endereco(endereco)
      assert_raise Ecto.NoResultsError, fn -> Localizacao.get_endereco!(endereco.id) end
    end

    test "change_endereco/1 returns a endereco changeset" do
      endereco = endereco_fixture()
      assert %Ecto.Changeset{} = Localizacao.change_endereco(endereco)
    end
  end
end
