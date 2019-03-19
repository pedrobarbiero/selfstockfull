defmodule SelfWeb.EstadoControllerTest do
  use SelfWeb.ConnCase

  alias Self.Localizacao

  @create_attrs %{nome: "some nome", uf: "some uf"}
  @update_attrs %{nome: "some updated nome", uf: "some updated uf"}
  @invalid_attrs %{nome: nil, uf: nil}

  def fixture(:estado) do
    {:ok, estado} = Localizacao.create_estado(@create_attrs)
    estado
  end

  describe "index" do
    test "lists all estados", %{conn: conn} do
      conn = get(conn, Routes.estado_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Estados"
    end
  end

  describe "new estado" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.estado_path(conn, :new))
      assert html_response(conn, 200) =~ "New Estado"
    end
  end

  describe "create estado" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.estado_path(conn, :create), estado: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.estado_path(conn, :show, id)

      conn = get(conn, Routes.estado_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Estado"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.estado_path(conn, :create), estado: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Estado"
    end
  end

  describe "edit estado" do
    setup [:create_estado]

    test "renders form for editing chosen estado", %{conn: conn, estado: estado} do
      conn = get(conn, Routes.estado_path(conn, :edit, estado))
      assert html_response(conn, 200) =~ "Edit Estado"
    end
  end

  describe "update estado" do
    setup [:create_estado]

    test "redirects when data is valid", %{conn: conn, estado: estado} do
      conn = put(conn, Routes.estado_path(conn, :update, estado), estado: @update_attrs)
      assert redirected_to(conn) == Routes.estado_path(conn, :show, estado)

      conn = get(conn, Routes.estado_path(conn, :show, estado))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, estado: estado} do
      conn = put(conn, Routes.estado_path(conn, :update, estado), estado: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Estado"
    end
  end

  describe "delete estado" do
    setup [:create_estado]

    test "deletes chosen estado", %{conn: conn, estado: estado} do
      conn = delete(conn, Routes.estado_path(conn, :delete, estado))
      assert redirected_to(conn) == Routes.estado_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.estado_path(conn, :show, estado))
      end
    end
  end

  defp create_estado(_) do
    estado = fixture(:estado)
    {:ok, estado: estado}
  end
end
