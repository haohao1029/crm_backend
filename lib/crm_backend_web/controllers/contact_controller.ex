defmodule CrmBackendWeb.ContactController do
  use CrmBackendWeb, :controller
  alias CrmBackend.Settings
  alias CrmBackend.Settings.Contact

  require IEx
  def index(conn, params) do
    list = Settings.list_users()
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(%{list: list})
      )
    
  end
  def show(conn,  %{"id" => id}) do
    contact = Settings.get_contact!(id)
    IO.inspect Kernel.<>("asdasd", "asdasdads")
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(
        200,
        Poison.encode!(contact)
      )
  end
  def create(conn, params) do
    case Settings.create_contact(params) do
      {:ok, contact} ->
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
    contact = Settings.get_contact!(params["id"])
    case Settings.update_contact(contact, params) do
      {:ok, contact} ->
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
    contact = Settings.get_contact!(params["id"])
    {:ok, _contact} = Settings.delete_contact(contact)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      200,
      Poison.encode!(%{message: "successful"})
    )
  end
end