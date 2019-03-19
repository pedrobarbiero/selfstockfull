defmodule SelfWeb.ClienteControllerTest do
  use SelfWeb.ConnCase

  alias Self.Ator

  @create_attrs %{cpf: "some cpf", data_nascimento: ~D[2010-04-17], email: "some email", nome: "some nome", sexo: 42, telefone: "some telefone"}
  @update_attrs %{cpf: "some updated cpf", data_nascimento: ~D[2011-05-18], email: "some updated email", nome: "some updated nome", sexo: 43, telefone: "some updated telefone"}
  @invalid_attrs %{cpf: nil, data_nascimento: nil, email: nil, nome: nil, sexo: nil, telefone: nil}

  def fixture(:cliente) do
    {:ok, cliente} = Ator.create_cliente(@create_attrs)
    cliente
  end

  describe "index" do
    test "lists all clientes", %{conn: conn} do
      conn = get(conn, Routes.cliente_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clientes"
    end
  end

  describe "new cliente" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cliente_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cliente"
    end
  end

  describe "create cliente" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cliente_path(conn, :create), cliente: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cliente_path(conn, :show, id)

      conn = get(conn, Routes.cliente_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cliente"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cliente_path(conn, :create), cliente: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cliente"
    end
  end

  describe "edit cliente" do
    setup [:create_cliente]

    test "renders form for editing chosen cliente", %{conn: conn, cliente: cliente} do
      conn = get(conn, Routes.cliente_path(conn, :edit, cliente))
      assert html_response(conn, 200) =~ "Edit Cliente"
    end
  end

  describe "update cliente" do
    setup [:create_cliente]

    test "redirects when data is valid", %{conn: conn, cliente: cliente} do
      conn = put(conn, Routes.cliente_path(conn, :update, cliente), cliente: @update_attrs)
      assert redirected_to(conn) == Routes.cliente_path(conn, :show, cliente)

      conn = get(conn, Routes.cliente_path(conn, :show, cliente))
      assert html_response(conn, 200) =~ "some updated cpf"
    end

    test "renders errors when data is invalid", %{conn: conn, cliente: cliente} do
      conn = put(conn, Routes.cliente_path(conn, :update, cliente), cliente: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cliente"
    end
  end

  describe "delete cliente" do
    setup [:create_cliente]

    test "deletes chosen cliente", %{conn: conn, cliente: cliente} do
      conn = delete(conn, Routes.cliente_path(conn, :delete, cliente))
      assert redirected_to(conn) == Routes.cliente_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cliente_path(conn, :show, cliente))
      end
    end
  end

  defp create_cliente(_) do
    cliente = fixture(:cliente)
    {:ok, cliente: cliente}
  end
end
