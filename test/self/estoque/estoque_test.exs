defmodule Self.EstoqueTest do
  use Self.DataCase

  alias Self.Estoque

  describe "produtos" do
    alias Self.Estoque.Produto

    @valid_attrs %{descricao: "some descricao", nome: "some nome", tipo: 42, valor_compra: "120.5", valor_venda: "120.5"}
    @update_attrs %{descricao: "some updated descricao", nome: "some updated nome", tipo: 43, valor_compra: "456.7", valor_venda: "456.7"}
    @invalid_attrs %{descricao: nil, nome: nil, tipo: nil, valor_compra: nil, valor_venda: nil}

    def produto_fixture(attrs \\ %{}) do
      {:ok, produto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Estoque.create_produto()

      produto
    end

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Estoque.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Estoque.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      assert {:ok, %Produto{} = produto} = Estoque.create_produto(@valid_attrs)
      assert produto.descricao == "some descricao"
      assert produto.nome == "some nome"
      assert produto.tipo == 42
      assert produto.valor_compra == Decimal.new("120.5")
      assert produto.valor_venda == Decimal.new("120.5")
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Estoque.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{} = produto} = Estoque.update_produto(produto, @update_attrs)
      assert produto.descricao == "some updated descricao"
      assert produto.nome == "some updated nome"
      assert produto.tipo == 43
      assert produto.valor_compra == Decimal.new("456.7")
      assert produto.valor_venda == Decimal.new("456.7")
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Estoque.update_produto(produto, @invalid_attrs)
      assert produto == Estoque.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Estoque.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Estoque.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Estoque.change_produto(produto)
    end
  end
end
