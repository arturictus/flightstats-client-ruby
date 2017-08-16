require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::ScheduledFlight do
  before(:each) do
    WebMock.reset!
  end

  describe "by_carrier_and_flight_number_departing_on" do
    it "must find flight flights" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_flights'
      flights = FlightStats::ScheduledFlight.by_carrier_and_flight_number_departing_on 'UA', '100', '2014', '07', '07'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'UA'
    end
  end

  describe "by_carrier_and_flight_number_arriving_on" do
    it "must find flight flights" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_flights'
      flights = FlightStats::ScheduledFlight.by_carrier_and_flight_number_arriving_on 'UA', '100', '2014', '07', '07'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'UA'
    end
  end

  describe "by_route_departing_on" do
    it "must find flight flights" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_flights'
      flights = FlightStats::ScheduledFlight.by_route_departing_on 'SFO', 'PDX', '2014', '07', '07'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'UA'
    end
  end

  describe "by_route_arriving_on" do
    it "must find flight flights" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_flights'
      flights = FlightStats::ScheduledFlight.by_route_arriving_on 'SFO', 'PDX', '2014', '07', '07'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'UA'
    end
  end

  describe "departing_from_airport_at_date_and_hour" do
    it "must find flight flights" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_flights'
      flights = FlightStats::ScheduledFlight.departing_from_airport_at_date_and_hour 'SFO', '2014', '07', '07', '18'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'UA'
    end
  end

  describe "arriving_at_airport_at_date_and_hour" do
    it "must find flight flights" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_flights'
      flights = FlightStats::ScheduledFlight.arriving_at_airport_at_date_and_hour 'PDX', '2014', '07', '07', '20'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'UA'
    end
  end

  describe "operator" do
    it "must respond to operator" do
      stub_api_request :get, FlightStats::ScheduledFlight.base_path, 'scheduled_with_codeshare'
      flights = FlightStats::ScheduledFlight.by_carrier_and_flight_number_departing_on 'UA', '100', '2014', '07', '07'
      flights.first.should be_an_instance_of FlightStats::ScheduledFlight
      flights.first.carrier_fs_code.should == 'DL'
      flights.first.operator.carrier_fs_code.should == 'AF'
      flights.first.operator.flight_number.should == '11'
      flights.first.operator.service_type.should == 'J'
      flights.first.operator.service_classes.should == ["R", "F", "J", "Y"]
      flights.first.operator.traffic_restrictions.should == []
    end
  end
end
