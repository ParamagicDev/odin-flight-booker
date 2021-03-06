require 'test_helper'

class BookingFlightsTest < ActionDispatch::IntegrationTest
  def setup
    @sfo = airports(:sfo)
    @nyc = airports(:nyc)
    @flight = flights(:one)
    @konnor = passengers(:konnor)
    @ryan = passengers(:ryan)
  end

  test 'should create a booking object with 2 passengers' do
    get root_url
    assert_response :success

    get flights_url, params: {
      to_airport: @sfo,
      from_airport: @nyc,
      start: Flight.formatted_date(Time.zone.now)
    }

    assert_response :success

    get new_booking_url, params: {
      num_passengers: 2,
      flight: @flight.id
    }

    assert_response :success

    assert_difference 'Booking.count', 1 do
      post bookings_path, params: {
        booking: {
          flight_id: @flight.id,
          passengers_attributes: {
            '0' => {
              passenger_id: @ryan.id,
              name: @ryan.name,
              email: @ryan.email
            },

            '1' => {
              passenger_id: @konnor.id,
              name: @konnor.name,
              email: @konnor.email
            }
          }
        }
      }

      assert_equal Booking.last.flight.passengers.count, 2
    end
  end
end
