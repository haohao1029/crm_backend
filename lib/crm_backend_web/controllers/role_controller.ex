defmodule CrmBackendWeb.RoleController do
    use CrmBackendWeb, :controller
    alias CrmBackend.Settings
    alias CrmBackend.Settings.Role
  
    require IEx
    def index(conn, params) do
        list = Settings.list_roles()
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(%{list: list})
        )
    end
    def show(conn,  %{"id" => id}) do
      role = Settings.get_role!(id)
  
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(role)
        )
    end
    def create(conn, params) do
      case Settings.create_role(params) do
        {:ok, role} ->
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(
            200,
            Poison.encode!(%{message: "successful"})
          )
        {:error, %Ecto.Changeset{} = changeset} ->
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(
            400,
            Poison.encode!(%{message: "error"})
          )
      end
    end
    def update(conn, %{"id" => id, "params" => params}) do
      role = Settings.get_role!(params["id"])
      case Settings.update_role(role, params) do
        {:ok, role} ->
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(
            200,
            Poison.encode!(%{message: "successful"})
          )
        {:error, %Ecto.Changeset{} = changeset} ->
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(
            400,
            Poison.encode!(%{message: "error"})
          )
      end
  
    end
    def delete(conn,params) do
      role = Settings.get_role!(params["id"])
      {:ok, _role} = Settings.delete_role(role)
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(%{message: "successful"})
      )
    end
  end