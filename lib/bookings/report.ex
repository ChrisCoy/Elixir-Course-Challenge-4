defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Booking
  alias Flightex.Bookings.Agent, as: BookingAgent

  def generate(filename) do
    # IO.inspect(Map.values(BookingAgent.get_all()))
    lines =
      BookingAgent.get_all()
      |> Map.values()
      |> Enum.map(&format_to_line/1)

    File.write(filename, lines)
  end

  defp format_to_line(%Booking{} = booking) do
    "#{booking.user_id},#{booking.local_origin},#{booking.local_destination},#{booking.complete_date}\n"
  end
end
