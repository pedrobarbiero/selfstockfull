defmodule SelfWeb.CompraControllerTest do
  use SelfWeb.ConnCase

  alias Self.Movimentacao

  @create_attrs %{data: ~D[2010-04-17], desconto: "120.5", icms: "some icms", numero: "some numero", vencimento: ~D[2010-04-17]}
  @update_attrs %{data: ~D[2011-05-18], desconto: "456.7", icms: "some updated icms", numero: "some updated numero", vencimento: ~D[2011-05-18]}
  @invalid_attrs %{data: nil, desconto: nil, icms: nil, numero: nil, vencimento: nil}

  def fixture(:compra) do
    {:ok, compra} = Movimentacao.create_compra(@create_attrs)
    compra
  end

  describe "index" do
    test "lists all compras", %{conn: conn} do
      conn = get(conn, Routes.compra_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Compras"
    end
  end

  describe "new compra" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.compra_path(conn, :new))
      assert html_response(conn, 200) =~ "New Compra"
    end
  end

  describe "create compra" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.compra_path(conn, :create), compra: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.compra_path(conn, :show, id)

      conn = get(conn, Routes.compra_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Compra"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.compra_path(conn, :create), compra: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Compra"
    end
  end

  describe "edit compra" do
    setup [:create_compra]

    test "renders form for editing chosen compra", %{conn: conn, compra: compra} do
      conn = get(conn, Routes.compra_path(conn, :edit, compra))
      assert html_response(conn, 200) =~ "Edit Compra"
    end
  end

  describe "update compra" do
    setup [:create_compra]

    test "redirects when data is valid", %{conn: conn, compra: compra} do
      conn = put(conn, Routes.compra_path(conn, :update, compra), compra: @update_attrs)
      assert redirected_to(conn) == Routes.compra_path(conn, :show, compra)

      conn = get(conn, Routes.compra_path(conn, :show, compra))
      assert html_response(conn, 200) =~ "some updated icms"
    end

    test "renders errors when data is invalid", %{conn: conn, compra: compra} do
      conn = put(conn, Routes.compra_path(conn, :update, compra), compra: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Compra"
    end
  end

  describe "delete compra" do
    setup [:create_compra]

    test "deletes chosen compra", %{conn: conn, compra: compra} do
      conn = delete(conn, Routes.compra_path(conn, :delete, compra))
      assert redirected_to(conn) == Routes.compra_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.compra_path(conn, :show, compra))
      end
    end
  end

  defp create_compra(_) do
    compra = fixture(:compra)
    {:ok, compra: compra}
  end
end
