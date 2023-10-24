@EndUserText.label: 'Booking - Inteface Entity'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_BOOKING_2303
  as projection on ZR_BOOKING_2303
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirLineID,
      ConnectionID,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      /* Associations */
      _BookingStaus,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent zi_travel_2303
}
