defmodule CrmBackendWeb.UserController do
    use CrmBackendWeb, :controller
    alias CrmBackend.Settings
    alias CrmBackend.Settings.User
  
    require IEx
    def index(conn, params) do
        list = Settings.list_Users()
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(%{list: list})
        ) 
    end
    def show(conn,  %{"id" => id}) do
      user = Settings.get_user!(id)
  
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(user)
        )
    end
    def create(conn, params) do
      case Settings.create_user(params) do
        {:ok, user} ->
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
      user = Settings.get_user!(params["id"])
      case Settings.update_user(user, params) do
        {:ok, user} ->
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
      user = Settings.get_user!(params["id"])
      {:ok, _user} = Settings.delete_user(user)
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(%{message: "successful"})
      )
    end
  end