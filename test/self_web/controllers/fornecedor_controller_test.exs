defmodule SelfWeb.FornecedorControllerTest do
  use SelfWeb.ConnCase

  alias Self.Ator

  @create_attrs %{cnpj: "some cnpj", email: "some email", inscrica_estadual: "some inscrica_estadual", nome_fantasia: "some nome_fantasia", razao_social: "some razao_social", telefone: "some telefone"}
  @update_attrs %{cnpj: "some updated cnpj", email: "some updated email", inscrica_estadual: "some updated inscrica_estadual", nome_fantasia: "some updated nome_fantasia", razao_social: "some updated razao_social", telefone: "some updated telefone"}
  @invalid_attrs %{cnpj: nil, email: nil, inscrica_estadual: nil, nome_fantasia: nil, razao_social: nil, telefone: nil}

  def fixture(:fornecedor) do
    {:ok, fornecedor} = Ator.create_fornecedor(@create_attrs)
    fornecedor
  end

  describe "index" do
    test "lists all fornecedores", %{conn: conn} do
      conn = get(conn, Routes.fornecedor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Fornecedores"
    end
  end

  describe "new fornecedor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.fornecedor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Fornecedor"
    end
  end

  describe "create fornecedor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.fornecedor_path(conn, :create), fornecedor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.fornecedor_path(conn, :show, id)

      conn = get(conn, Routes.fornecedor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Fornecedor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.fornecedor_path(conn, :create), fornecedor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Fornecedor"
    end
  end

  describe "edit fornecedor" do
    setup [:create_fornecedor]

    test "renders form for editing chosen fornecedor", %{conn: conn, fornecedor: fornecedor} do
      conn = get(conn, Routes.fornecedor_path(conn, :edit, fornecedor))
      assert html_response(conn, 200) =~ "Edit Fornecedor"
    end
  end

  describe "update fornecedor" do
    setup [:create_fornecedor]

    test "redirects when data is valid", %{conn: conn, fornecedor: fornecedor} do
      conn = put(conn, Routes.fornecedor_path(conn, :update, fornecedor), fornecedor: @update_attrs)
      assert redirected_to(conn) == Routes.fornecedor_path(conn, :show, fornecedor)

      conn = get(conn, Routes.fornecedor_path(conn, :show, fornecedor))
      assert html_response(conn, 200) =~ "some updated cnpj"
    end

    test "renders errors when data is invalid", %{conn: conn, fornecedor: fornecedor} do
      conn = put(conn, Routes.fornecedor_path(conn, :update, fornecedor), fornecedor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Fornecedor"
    end
  end

  describe "delete fornecedor" do
    setup [:create_fornecedor]

    test "deletes chosen fornecedor", %{conn: conn, fornecedor: fornecedor} do
      conn = delete(conn, Routes.fornecedor_path(conn, :delete, fornecedor))
      assert redirected_to(conn) == Routes.fornecedor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.fornecedor_path(conn, :show, fornecedor))
      end
    end
  end

  defp create_fornecedor(_) do
    fornecedor = fixture(:fornecedor)
    {:ok, fornecedor: fornecedor}
  end
end
