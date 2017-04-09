defmodule Kulukin.HelperPlugs do
  defmacro __using__(_) do

    quote do

      def require_authorized(%{assigns: %{authorized: true}} = conn, _) do
        conn
      end
      def require_authorized(conn,_) do
         conn
         |> put_flash(:error, "Not authorized")
         |> redirect(to: "/")
         |> halt
      end

    end

  end

end
