codeunit 50100 "Geocoding Management"
{
    procedure GetCoordinates(var Customer: Record Customer)
    var
        GoogleAPISetup: Record "Google API Setup";
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        Url: Text;
        Address: Text;
        JsonResponse: Text;
        JsonObj: JsonObject;
        ResultsArray: JsonArray;
        GeometryObj: JsonObject;
        LocationObj: JsonObject;
        LatToken: JsonToken;
        LngToken: JsonToken;
        StatusToken: JsonToken;
        ResultToken: JsonToken;
        GeometryToken: JsonToken;
        LocationToken: JsonToken;
        TextManagement: Codeunit 10;
    begin
        // Check if geocoding is enabled
        GoogleAPISetup.GetSetup();
        GoogleAPISetup.Get('GOOGLE');

        if not GoogleAPISetup."Enable Geocoding" then
            Error('Geocoding is disabled in the Google API Setup.');

        // Build the address string
        Address := StrSubstNo('%1, %2, %3 %4',
          Customer.Address,
          Customer.City,
          Customer."Post Code",
          Customer."Country/Region Code");
        Address := TextManagement.UrlEncode(Address);

        // Build the API URL
        Url := StrSubstNo(
          'https://maps.googleapis.com/maps/api/geocode/json?address=%1&key=%2',
          Address,
          GoogleAPISetup."API Key"
        );

        // Call Google API
        if not HttpClient.Get(Url, HttpResponse) then
            Error('Failed to connect to Google API: %1', GetLastErrorText());

        // Check HTTP status
        if not HttpResponse.IsSuccessStatusCode() then
            Error('Google API returned HTTP error: %1', HttpResponse.HttpStatusCode());

        // Read response content
        HttpResponse.Content.ReadAs(JsonResponse);

        // Parse JSON response
        if not JsonObj.ReadFrom(JsonResponse) then
            Error('Failed to parse JSON response.');

        // Check API status
        if not JsonObj.Get('status', StatusToken) then
            Error('Response missing status.');
        if StatusToken.AsValue().AsText() <> 'OK' then
            Error('Geocoding failed: %1', StatusToken.AsValue().AsText());

        // Extract results
        if not JsonObj.Get('results', ResultToken) then
            Error('Response missing results.');
        ResultsArray := ResultToken.AsArray();
        if ResultsArray.Count = 0 then
            Error('No results found for the address.');

        // Get first result's geometry
        ResultsArray.Get(0, ResultToken);
        if not ResultToken.AsObject().Get('geometry', GeometryToken) then
            Error('Result missing geometry.');
        if not GeometryToken.AsObject().Get('location', LocationToken) then
            Error('Geometry missing location.');

        // Extract latitude and longitude
        if not LocationToken.AsObject().Get('lat', LatToken) then
            Error('Location missing lat.');
        if not LocationToken.AsObject().Get('lng', LngToken) then
            Error('Location missing lng.');

        // Update customer record
        Customer.Latitude := LatToken.AsValue().AsDecimal();
        Customer.Longitude := LngToken.AsValue().AsDecimal();
        Customer.Modify();
    end;
}