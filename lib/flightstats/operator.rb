module FlightStats
  class Operator < Resource
    attr_accessor :carrier_fs_code,
                  :flight_number,
                  :service_type,
                  :service_classes,
                  :traffic_restrictions
  end
end
