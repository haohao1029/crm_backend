defmodule CrmBackendWeb.AssetController do
    use CrmBackendWeb, :controller
    alias CrmBackend.Settings
    alias CrmBackend.Settings.Asset
  
    require IEx
    def index(conn, params) do
        list = Settings.list_Assets()
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(%{list: list})
        ) 
    end
    def show(conn,  %{"id" => id}) do
      asset = Settings.get_asset!(id)
  
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(asset)
        )
    end
    def create(conn, params) do
      case Settings.create_asset(params) do
        {:ok, asset} ->
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
      asset = Settings.get_asset!(params["id"])
      case Settings.update_asset(asset, params) do
        {:ok, asset} ->
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
      asset = Settings.get_asset!(params["id"])
      {:ok, _asset} = Settings.delete_asset(asset)
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(%{message: "successful"})
      )
    end
  end