defmodule SelfWeb.PaisControllerTest do
  use SelfWeb.ConnCase

  alias Self.Localizacao

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:pais) do
    {:ok, pais} = Localizacao.create_pais(@create_attrs)
    pais
  end

  describe "index" do
    test "lists all paises", %{conn: conn} do
      conn = get(conn, Routes.pais_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Paises"
    end
  end

  describe "new pais" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pais_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pais"
    end
  end

  describe "create pais" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pais_path(conn, :create), pais: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pais_path(conn, :show, id)

      conn = get(conn, Routes.pais_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pais"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pais_path(conn, :create), pais: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pais"
    end
  end

  describe "edit pais" do
    setup [:create_pais]

    test "renders form for editing chosen pais", %{conn: conn, pais: pais} do
      conn = get(conn, Routes.pais_path(conn, :edit, pais))
      assert html_response(conn, 200) =~ "Edit Pais"
    end
  end

  describe "update pais" do
    setup [:create_pais]

    test "redirects when data is valid", %{conn: conn, pais: pais} do
      conn = put(conn, Routes.pais_path(conn, :update, pais), pais: @update_attrs)
      assert redirected_to(conn) == Routes.pais_path(conn, :show, pais)

      conn = get(conn, Routes.pais_path(conn, :show, pais))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, pais: pais} do
      conn = put(conn, Routes.pais_path(conn, :update, pais), pais: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pais"
    end
  end

  describe "delete pais" do
    setup [:create_pais]

    test "deletes chosen pais", %{conn: conn, pais: pais} do
      conn = delete(conn, Routes.pais_path(conn, :delete, pais))
      assert redirected_to(conn) == Routes.pais_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pais_path(conn, :show, pais))
      end
    end
  end

  defp create_pais(_) do
    pais = fixture(:pais)
    {:ok, pais: pais}
  end
end
