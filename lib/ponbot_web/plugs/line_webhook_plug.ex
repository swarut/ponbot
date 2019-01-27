defmodule PonbotWeb.LineWebhookPlug do
  import Plug.Conn
  require IEx

  def init(opts) do
    opts
  end

  def call(conn, opts) do

    mount = Keyword.get(opts, :mount)
    case conn.path_info do
      ^mount ->
        IEx.pry
        line_secret = Keyword.get(opts, :line_secret)
        {:ok, body, _} = read_body(conn)
        IO.puts("RAW REQUEST BODY = #{inspect body}")
        [expected_signature | []]= get_req_header(conn, "x-line-signature")
        computed_signature =  :crypto.hmac(:sha256, line_secret, body) |> Base.encode16
        case computed_signature do
          ^expected_signature ->

            conn
          _ ->
            conn
            |> put_resp_content_type("text/plain")
            |> send_resp(401, "Not Authorized")
            |> halt
        end
      _ ->
        IEx.pry
        conn
    end
  end
end
