defmodule SelfWeb.VendaControllerTest do
  use SelfWeb.ConnCase

  alias Self.Movimentacao

  @create_attrs %{data: ~D[2010-04-17], desconto: "120.5", valor: "120.5"}
  @update_attrs %{data: ~D[2011-05-18], desconto: "456.7", valor: "456.7"}
  @invalid_attrs %{data: nil, desconto: nil, valor: nil}

  def fixture(:venda) do
    {:ok, venda} = Movimentacao.create_venda(@create_attrs)
    venda
  end

  describe "index" do
    test "lists all vendas", %{conn: conn} do
      conn = get(conn, Routes.venda_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Vendas"
    end
  end

  describe "new venda" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.venda_path(conn, :new))
      assert html_response(conn, 200) =~ "New Venda"
    end
  end

  describe "create venda" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.venda_path(conn, :create), venda: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.venda_path(conn, :show, id)

      conn = get(conn, Routes.venda_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Venda"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.venda_path(conn, :create), venda: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Venda"
    end
  end

  describe "edit venda" do
    setup [:create_venda]

    test "renders form for editing chosen venda", %{conn: conn, venda: venda} do
      conn = get(conn, Routes.venda_path(conn, :edit, venda))
      assert html_response(conn, 200) =~ "Edit Venda"
    end
  end

  describe "update venda" do
    setup [:create_venda]

    test "redirects when data is valid", %{conn: conn, venda: venda} do
      conn = put(conn, Routes.venda_path(conn, :update, venda), venda: @update_attrs)
      assert redirected_to(conn) == Routes.venda_path(conn, :show, venda)

      conn = get(conn, Routes.venda_path(conn, :show, venda))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, venda: venda} do
      conn = put(conn, Routes.venda_path(conn, :update, venda), venda: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Venda"
    end
  end

  describe "delete venda" do
    setup [:create_venda]

    test "deletes chosen venda", %{conn: conn, venda: venda} do
      conn = delete(conn, Routes.venda_path(conn, :delete, venda))
      assert redirected_to(conn) == Routes.venda_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.venda_path(conn, :show, venda))
      end
    end
  end

  defp create_venda(_) do
    venda = fixture(:venda)
    {:ok, venda: venda}
  end
end
