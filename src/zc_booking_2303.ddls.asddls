@EndUserText.label: 'Booking - Consumption Entity'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'BookingID' ]
define view entity ZC_BOOKING_2303
  as projection on zr_booking_2303
{
  key BookingUUID,
      TravelUUID,

      @Search.defaultSearchElement: true
      BookingID,
      BookingDate,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerID,
      _Customer.LastName as CustomerName,

      @ObjectModel.text.element: [ 'CarrierName' ]
      AirLineID,
      _Carrier.Name      as CarrierName,

      ConnectionID,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      
      @ObjectModel.text.element: [ 'CarrierName' ]
      BookingStatus,
      _BookingStaus._Text.Text as BookingStatusText : localized,
      
      LocalLastChangedAt,
      /* Associations */
      _BookingStaus,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZC_TRAVEL_2303
}
