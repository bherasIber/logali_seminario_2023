@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zr_booking_2303
  as select from zbooking_log_a
  association        to parent zr_travel_2303    as _Travel       on  $projection.TravelUUID = _Travel.TravelUUID
  association [1..1] to /DMO/I_Customer          as _Customer     on  $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _Carrier      on  $projection.AirLineID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection        as _Connection   on  $projection.ConnectionID = _Connection.ConnectionID
                                                                  and $projection.AirLineID    = _Connection.AirlineID
  association [1..1] to /DMO/I_Booking_Status_VH as _BookingStaus on  $projection.BookingStatus = _BookingStaus.BookingStatus
{

  key booking_uuid          as BookingUUID,
      parent_uuid           as TravelUUID,

      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as AirLineID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Travel,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStaus

}
