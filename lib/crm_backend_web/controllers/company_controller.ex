defmodule CrmBackendWeb.CompanyController do
    use CrmBackendWeb, :controller
    alias CrmBackend.Settings
    alias CrmBackend.Settings.Company
  
    require IEx
    def index(conn, params) do
      list = Settings.list_companies()
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(%{list: list})
      )      
    end
    def show(conn,  %{"id" => id}) do
      company = Settings.get_company!(id)
  
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(
          200,
          Poison.encode!(company)
        )
    end
    def create(conn, params) do
      case Settings.create_company(params) do
        {:ok, company} ->
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
      company = Settings.get_company!(params["id"])
      case Settings.update_company(company, params) do
        {:ok, company} ->
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
      company = Settings.get_company!(params["id"])
      {:ok, _company} = Settings.delete_company(company)
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(%{message: "successful"})
      )
    end
  end