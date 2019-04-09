defmodule SelfWeb.ItemCompraControllerTest do
  use SelfWeb.ConnCase

  alias Self.Movimentacao

  @create_attrs %{quantidade: 42, valor_unitario: "120.5"}
  @update_attrs %{quantidade: 43, valor_unitario: "456.7"}
  @invalid_attrs %{quantidade: nil, valor_unitario: nil}

  def fixture(:item_compra) do
    {:ok, item_compra} = Movimentacao.create_item_compra(@create_attrs)
    item_compra
  end

  describe "index" do
    test "lists all itens_compra", %{conn: conn} do
      conn = get(conn, Routes.item_compra_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Itens compra"
    end
  end

  describe "new item_compra" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.item_compra_path(conn, :new))
      assert html_response(conn, 200) =~ "New Item compra"
    end
  end

  describe "create item_compra" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_compra_path(conn, :create), item_compra: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.item_compra_path(conn, :show, id)

      conn = get(conn, Routes.item_compra_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Item compra"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_compra_path(conn, :create), item_compra: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Item compra"
    end
  end

  describe "edit item_compra" do
    setup [:create_item_compra]

    test "renders form for editing chosen item_compra", %{conn: conn, item_compra: item_compra} do
      conn = get(conn, Routes.item_compra_path(conn, :edit, item_compra))
      assert html_response(conn, 200) =~ "Edit Item compra"
    end
  end

  describe "update item_compra" do
    setup [:create_item_compra]

    test "redirects when data is valid", %{conn: conn, item_compra: item_compra} do
      conn = put(conn, Routes.item_compra_path(conn, :update, item_compra), item_compra: @update_attrs)
      assert redirected_to(conn) == Routes.item_compra_path(conn, :show, item_compra)

      conn = get(conn, Routes.item_compra_path(conn, :show, item_compra))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, item_compra: item_compra} do
      conn = put(conn, Routes.item_compra_path(conn, :update, item_compra), item_compra: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Item compra"
    end
  end

  describe "delete item_compra" do
    setup [:create_item_compra]

    test "deletes chosen item_compra", %{conn: conn, item_compra: item_compra} do
      conn = delete(conn, Routes.item_compra_path(conn, :delete, item_compra))
      assert redirected_to(conn) == Routes.item_compra_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.item_compra_path(conn, :show, item_compra))
      end
    end
  end

  defp create_item_compra(_) do
    item_compra = fixture(:item_compra)
    {:ok, item_compra: item_compra}
  end
end
