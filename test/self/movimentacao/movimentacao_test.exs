defmodule Self.MovimentacaoTest do
  use Self.DataCase

  alias Self.Movimentacao

  describe "compras" do
    alias Self.Movimentacao.Compra

    @valid_attrs %{data: ~D[2010-04-17], desconto: "120.5", icms: "some icms", numero: "some numero", vencimento: ~D[2010-04-17]}
    @update_attrs %{data: ~D[2011-05-18], desconto: "456.7", icms: "some updated icms", numero: "some updated numero", vencimento: ~D[2011-05-18]}
    @invalid_attrs %{data: nil, desconto: nil, icms: nil, numero: nil, vencimento: nil}

    def compra_fixture(attrs \\ %{}) do
      {:ok, compra} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Movimentacao.create_compra()

      compra
    end

    test "list_compras/0 returns all compras" do
      compra = compra_fixture()
      assert Movimentacao.list_compras() == [compra]
    end

    test "get_compra!/1 returns the compra with given id" do
      compra = compra_fixture()
      assert Movimentacao.get_compra!(compra.id) == compra
    end

    test "create_compra/1 with valid data creates a compra" do
      assert {:ok, %Compra{} = compra} = Movimentacao.create_compra(@valid_attrs)
      assert compra.data == ~D[2010-04-17]
      assert compra.desconto == Decimal.new("120.5")
      assert compra.icms == "some icms"
      assert compra.numero == "some numero"
      assert compra.vencimento == ~D[2010-04-17]
    end

    test "create_compra/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movimentacao.create_compra(@invalid_attrs)
    end

    test "update_compra/2 with valid data updates the compra" do
      compra = compra_fixture()
      assert {:ok, %Compra{} = compra} = Movimentacao.update_compra(compra, @update_attrs)
      assert compra.data == ~D[2011-05-18]
      assert compra.desconto == Decimal.new("456.7")
      assert compra.icms == "some updated icms"
      assert compra.numero == "some updated numero"
      assert compra.vencimento == ~D[2011-05-18]
    end

    test "update_compra/2 with invalid data returns error changeset" do
      compra = compra_fixture()
      assert {:error, %Ecto.Changeset{}} = Movimentacao.update_compra(compra, @invalid_attrs)
      assert compra == Movimentacao.get_compra!(compra.id)
    end

    test "delete_compra/1 deletes the compra" do
      compra = compra_fixture()
      assert {:ok, %Compra{}} = Movimentacao.delete_compra(compra)
      assert_raise Ecto.NoResultsError, fn -> Movimentacao.get_compra!(compra.id) end
    end

    test "change_compra/1 returns a compra changeset" do
      compra = compra_fixture()
      assert %Ecto.Changeset{} = Movimentacao.change_compra(compra)
    end
  end

  describe "itens_compra" do
    alias Self.Movimentacao.ItemCompra

    @valid_attrs %{quantidade: 42, valor_unitario: "120.5"}
    @update_attrs %{quantidade: 43, valor_unitario: "456.7"}
    @invalid_attrs %{quantidade: nil, valor_unitario: nil}

    def item_compra_fixture(attrs \\ %{}) do
      {:ok, item_compra} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Movimentacao.create_item_compra()

      item_compra
    end

    test "list_itens_compra/0 returns all itens_compra" do
      item_compra = item_compra_fixture()
      assert Movimentacao.list_itens_compra() == [item_compra]
    end

    test "get_item_compra!/1 returns the item_compra with given id" do
      item_compra = item_compra_fixture()
      assert Movimentacao.get_item_compra!(item_compra.id) == item_compra
    end

    test "create_item_compra/1 with valid data creates a item_compra" do
      assert {:ok, %ItemCompra{} = item_compra} = Movimentacao.create_item_compra(@valid_attrs)
      assert item_compra.quantidade == 42
      assert item_compra.valor_unitario == Decimal.new("120.5")
    end

    test "create_item_compra/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movimentacao.create_item_compra(@invalid_attrs)
    end

    test "update_item_compra/2 with valid data updates the item_compra" do
      item_compra = item_compra_fixture()
      assert {:ok, %ItemCompra{} = item_compra} = Movimentacao.update_item_compra(item_compra, @update_attrs)
      assert item_compra.quantidade == 43
      assert item_compra.valor_unitario == Decimal.new("456.7")
    end

    test "update_item_compra/2 with invalid data returns error changeset" do
      item_compra = item_compra_fixture()
      assert {:error, %Ecto.Changeset{}} = Movimentacao.update_item_compra(item_compra, @invalid_attrs)
      assert item_compra == Movimentacao.get_item_compra!(item_compra.id)
    end

    test "delete_item_compra/1 deletes the item_compra" do
      item_compra = item_compra_fixture()
      assert {:ok, %ItemCompra{}} = Movimentacao.delete_item_compra(item_compra)
      assert_raise Ecto.NoResultsError, fn -> Movimentacao.get_item_compra!(item_compra.id) end
    end

    test "change_item_compra/1 returns a item_compra changeset" do
      item_compra = item_compra_fixture()
      assert %Ecto.Changeset{} = Movimentacao.change_item_compra(item_compra)
    end
  end

  describe "vendas" do
    alias Self.Movimentacao.Venda

    @valid_attrs %{data: ~D[2010-04-17], desconto: "120.5", valor: "120.5"}
    @update_attrs %{data: ~D[2011-05-18], desconto: "456.7", valor: "456.7"}
    @invalid_attrs %{data: nil, desconto: nil, valor: nil}

    def venda_fixture(attrs \\ %{}) do
      {:ok, venda} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Movimentacao.create_venda()

      venda
    end

    test "list_vendas/0 returns all vendas" do
      venda = venda_fixture()
      assert Movimentacao.list_vendas() == [venda]
    end

    test "get_venda!/1 returns the venda with given id" do
      venda = venda_fixture()
      assert Movimentacao.get_venda!(venda.id) == venda
    end

    test "create_venda/1 with valid data creates a venda" do
      assert {:ok, %Venda{} = venda} = Movimentacao.create_venda(@valid_attrs)
      assert venda.data == ~D[2010-04-17]
      assert venda.desconto == Decimal.new("120.5")
      assert venda.valor == Decimal.new("120.5")
    end

    test "create_venda/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movimentacao.create_venda(@invalid_attrs)
    end

    test "update_venda/2 with valid data updates the venda" do
      venda = venda_fixture()
      assert {:ok, %Venda{} = venda} = Movimentacao.update_venda(venda, @update_attrs)
      assert venda.data == ~D[2011-05-18]
      assert venda.desconto == Decimal.new("456.7")
      assert venda.valor == Decimal.new("456.7")
    end

    test "update_venda/2 with invalid data returns error changeset" do
      venda = venda_fixture()
      assert {:error, %Ecto.Changeset{}} = Movimentacao.update_venda(venda, @invalid_attrs)
      assert venda == Movimentacao.get_venda!(venda.id)
    end

    test "delete_venda/1 deletes the venda" do
      venda = venda_fixture()
      assert {:ok, %Venda{}} = Movimentacao.delete_venda(venda)
      assert_raise Ecto.NoResultsError, fn -> Movimentacao.get_venda!(venda.id) end
    end

    test "change_venda/1 returns a venda changeset" do
      venda = venda_fixture()
      assert %Ecto.Changeset{} = Movimentacao.change_venda(venda)
    end
  end

  describe "itens_venda" do
    alias Self.Movimentacao.ItemVenda

    @valid_attrs %{quantidade: 42}
    @update_attrs %{quantidade: 43}
    @invalid_attrs %{quantidade: nil}

    def item_venda_fixture(attrs \\ %{}) do
      {:ok, item_venda} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Movimentacao.create_item_venda()

      item_venda
    end

    test "list_itens_venda/0 returns all itens_venda" do
      item_venda = item_venda_fixture()
      assert Movimentacao.list_itens_venda() == [item_venda]
    end

    test "get_item_venda!/1 returns the item_venda with given id" do
      item_venda = item_venda_fixture()
      assert Movimentacao.get_item_venda!(item_venda.id) == item_venda
    end

    test "create_item_venda/1 with valid data creates a item_venda" do
      assert {:ok, %ItemVenda{} = item_venda} = Movimentacao.create_item_venda(@valid_attrs)
      assert item_venda.quantidade == 42
    end

    test "create_item_venda/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movimentacao.create_item_venda(@invalid_attrs)
    end

    test "update_item_venda/2 with valid data updates the item_venda" do
      item_venda = item_venda_fixture()
      assert {:ok, %ItemVenda{} = item_venda} = Movimentacao.update_item_venda(item_venda, @update_attrs)
      assert item_venda.quantidade == 43
    end

    test "update_item_venda/2 with invalid data returns error changeset" do
      item_venda = item_venda_fixture()
      assert {:error, %Ecto.Changeset{}} = Movimentacao.update_item_venda(item_venda, @invalid_attrs)
      assert item_venda == Movimentacao.get_item_venda!(item_venda.id)
    end

    test "delete_item_venda/1 deletes the item_venda" do
      item_venda = item_venda_fixture()
      assert {:ok, %ItemVenda{}} = Movimentacao.delete_item_venda(item_venda)
      assert_raise Ecto.NoResultsError, fn -> Movimentacao.get_item_venda!(item_venda.id) end
    end

    test "change_item_venda/1 returns a item_venda changeset" do
      item_venda = item_venda_fixture()
      assert %Ecto.Changeset{} = Movimentacao.change_item_venda(item_venda)
    end
  end
end
