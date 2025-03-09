namespace TestProject.TestProject;

using Microsoft.Sales.Customer;

tableextension 50100 "Customet Ext" extends Customer
{
    fields
    {
        field(50100; "Latitude"; Decimal)
        {
            Caption = 'Latitude';
            DataClassification = CustomerContent;
            Description = 'Stores latitude from Google Geocoding API';
            DecimalPlaces = 6 : 6;
        }
        field(50101; "Longitude"; Decimal)
        {
            Caption = 'Longitude';
            Description = 'Stores longitude from Google Geocoding API';
            DataClassification = CustomerContent;
            DecimalPlaces = 6 : 6;
        }
    }
}
