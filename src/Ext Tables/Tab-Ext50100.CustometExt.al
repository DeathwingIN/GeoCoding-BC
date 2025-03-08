namespace TestProject.TestProject;

using Microsoft.Sales.Customer;

tableextension 50100 "Customet Ext" extends Customer
{
    fields
    {
        field(50100; "Latitude"; Decimal)
        {
            Caption = 'Latitude';
            DataClassification = ToBeClassified;
        }
        field(50101; "Longitude"; Decimal)
        {
            Caption = 'Longitude';
            DataClassification = ToBeClassified;
        }
    }
}
