defmodule Flightex do
  # alias Flightex.Bookings.CreateOrUpdate
  # alias Flightex.Users.CreateOrUpdate

  defdelegate create_or_update_user(params), to: Flightex.Users.CreateOrUpdate, as: :call
  defdelegate create_or_update_booking(params), to: Flightex.Bookings.CreateOrUpdate, as: :call

  def start_agents do
    Flightex.Bookings.Agent.start_link(%{})
    Flightex.Users.Agent.start_link(%{})
  end
end
