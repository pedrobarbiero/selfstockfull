defmodule SelfWeb.CidadeControllerTest do
  use SelfWeb.ConnCase

  alias Self.Localizacao

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:cidade) do
    {:ok, cidade} = Localizacao.create_cidade(@create_attrs)
    cidade
  end

  describe "index" do
    test "lists all cidades", %{conn: conn} do
      conn = get(conn, Routes.cidade_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cidades"
    end
  end

  describe "new cidade" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cidade_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cidade"
    end
  end

  describe "create cidade" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cidade_path(conn, :create), cidade: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cidade_path(conn, :show, id)

      conn = get(conn, Routes.cidade_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cidade"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cidade_path(conn, :create), cidade: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cidade"
    end
  end

  describe "edit cidade" do
    setup [:create_cidade]

    test "renders form for editing chosen cidade", %{conn: conn, cidade: cidade} do
      conn = get(conn, Routes.cidade_path(conn, :edit, cidade))
      assert html_response(conn, 200) =~ "Edit Cidade"
    end
  end

  describe "update cidade" do
    setup [:create_cidade]

    test "redirects when data is valid", %{conn: conn, cidade: cidade} do
      conn = put(conn, Routes.cidade_path(conn, :update, cidade), cidade: @update_attrs)
      assert redirected_to(conn) == Routes.cidade_path(conn, :show, cidade)

      conn = get(conn, Routes.cidade_path(conn, :show, cidade))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, cidade: cidade} do
      conn = put(conn, Routes.cidade_path(conn, :update, cidade), cidade: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cidade"
    end
  end

  describe "delete cidade" do
    setup [:create_cidade]

    test "deletes chosen cidade", %{conn: conn, cidade: cidade} do
      conn = delete(conn, Routes.cidade_path(conn, :delete, cidade))
      assert redirected_to(conn) == Routes.cidade_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cidade_path(conn, :show, cidade))
      end
    end
  end

  defp create_cidade(_) do
    cidade = fixture(:cidade)
    {:ok, cidade: cidade}
  end
end
