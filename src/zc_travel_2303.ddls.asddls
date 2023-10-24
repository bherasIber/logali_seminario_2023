@EndUserText.label: 'Travel - Consumption Entity'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_TRAVEL_2303
  provider contract transactional_query
  as projection on zr_travel_2303
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.6
      TravelID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,
      _Agency.Name        as AgencyName,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerID,
      _Customer.LastName  as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,

      OverallStatus,
      _Overall._Text.Text as OverallText : localized, //filtramos el idioma de conexión, no lo hacemos en el root view sólo en la vista de cliente.

      //LocalCreatedBy,
      //LocalCreatedAt,
      //LocalLastChangedBy,
      LocalLastChangedAt,
      //LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child zc_booking_2303,
      _Currency,
      _Customer,
      _Overall
}
