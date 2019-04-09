defmodule SelfWeb.ItemVendaControllerTest do
  use SelfWeb.ConnCase

  alias Self.Movimentacao

  @create_attrs %{quantidade: 42}
  @update_attrs %{quantidade: 43}
  @invalid_attrs %{quantidade: nil}

  def fixture(:item_venda) do
    {:ok, item_venda} = Movimentacao.create_item_venda(@create_attrs)
    item_venda
  end

  describe "index" do
    test "lists all itens_venda", %{conn: conn} do
      conn = get(conn, Routes.item_venda_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Itens venda"
    end
  end

  describe "new item_venda" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.item_venda_path(conn, :new))
      assert html_response(conn, 200) =~ "New Item venda"
    end
  end

  describe "create item_venda" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_venda_path(conn, :create), item_venda: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.item_venda_path(conn, :show, id)

      conn = get(conn, Routes.item_venda_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Item venda"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_venda_path(conn, :create), item_venda: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Item venda"
    end
  end

  describe "edit item_venda" do
    setup [:create_item_venda]

    test "renders form for editing chosen item_venda", %{conn: conn, item_venda: item_venda} do
      conn = get(conn, Routes.item_venda_path(conn, :edit, item_venda))
      assert html_response(conn, 200) =~ "Edit Item venda"
    end
  end

  describe "update item_venda" do
    setup [:create_item_venda]

    test "redirects when data is valid", %{conn: conn, item_venda: item_venda} do
      conn = put(conn, Routes.item_venda_path(conn, :update, item_venda), item_venda: @update_attrs)
      assert redirected_to(conn) == Routes.item_venda_path(conn, :show, item_venda)

      conn = get(conn, Routes.item_venda_path(conn, :show, item_venda))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, item_venda: item_venda} do
      conn = put(conn, Routes.item_venda_path(conn, :update, item_venda), item_venda: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Item venda"
    end
  end

  describe "delete item_venda" do
    setup [:create_item_venda]

    test "deletes chosen item_venda", %{conn: conn, item_venda: item_venda} do
      conn = delete(conn, Routes.item_venda_path(conn, :delete, item_venda))
      assert redirected_to(conn) == Routes.item_venda_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.item_venda_path(conn, :show, item_venda))
      end
    end
  end

  defp create_item_venda(_) do
    item_venda = fixture(:item_venda)
    {:ok, item_venda: item_venda}
  end
end
