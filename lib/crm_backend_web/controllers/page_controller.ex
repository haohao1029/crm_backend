defmodule CrmBackendWeb.PageController do
    use CrmBackendWeb, :controller
    alias CrmBackend.Settings
    alias CrmBackend.Settings.Contact
    def webhook(conn, params) do
      final = 
        case params["scope"] do
          "gen_input" ->
            final = CrmBackend.get_columns(params["module"])
          "assoc_data" ->
            final = Repo.all(from a in params["database"], select: a.name)
        end
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!(final))
    end

    def datatable(conn, params) do
        limit = params["length"]
        offset = params["start"]
        column_no = hd(params["order"])["column"] 
        key = Enum.at(params["columns"], column_no)["data"] |> String.to_atom()
        dir = Enum.at(params["order"], 0)["dir"] |> String.to_atom()
        order_by = [{dir, key}]
        module = Module.concat(["CrmBackend", "Settings", params["schema"]])
        search = params["search"]["value"]
        draw = params["draw"]

        final = getDatatableData(module, search, limit, offset, order_by, draw)
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!(final))
    end

    defp getDatatableData(module, search, limit, offset, order_by, draw) do
        data =
          Repo.all(
            from(a in module, where: ilike(a.name, ^"%#{search}%"))
          )
        data2 =
          Repo.all(
            from(
              a in module,
              where: ilike(a.name, ^"%#{search}%"),
              limit: ^limit,
              offset: ^offset,
              order_by: ^order_by
            )
          )
          |> Enum.map(fn x -> CrmBackend.s_to_map(x) end)

        json = %{
          data: data2,
          recordsTotal: Enum.count(data2),
          recordsFiltered: Enum.count(data),
          draw: draw
        }
    end
end  