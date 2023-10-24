@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view Travel'
define root view entity zr_travel_2303
  as select from ztravel_log_a
  composition [0..*] of zr_booking_2303          as _Booking
  association [0..1] to /DMO/I_Agency            as _Agency   on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer on $projection.CustomerID = _Customer.CustomerID
  association [0..1] to /DMO/I_Overall_Status_VH as _Overall  on $projection.OverallStatus = _Overall.OverallStatus
  association [0..1] to I_Currency               as _Currency on $projection.CurrencyCode = _Currency.Currency
{

  key travel_uuid           as TravelUUID,

      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //ETAG field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      
      // _association_name // Make association public
      _Booking,
      _Agency,
      _Customer,
      _Overall,
      _Currency
}
