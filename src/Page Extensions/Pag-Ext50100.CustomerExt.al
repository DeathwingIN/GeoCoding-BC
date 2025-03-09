namespace TestProject.TestProject;

using Microsoft.Sales.Customer;

pageextension 50100 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Latitude; Rec.Latitude)
            {
                ApplicationArea = All;
                ToolTip = 'Latitude from Google Geocoding API';
                Editable = false;
            }
            field(Longitude; Rec.Longitude)
            {
                ApplicationArea = All;
                ToolTip = 'Longitude from Google Geocoding API';
                Editable = false;
            }
        }
    }


    actions
    {
        addfirst(processing)
        {
            action(GetCoordinates)
            {
                ApplicationArea = All;
                Caption = 'Get Coordinates';
                Image = Map;
                ToolTip = 'Fetch latitude/longitude from Google API';

                trigger OnAction()
                var
                    GeoCodeMgt: Codeunit "Geocoding Management";
                begin
                    GeoCodeMgt.GetCoordinates(Rec);
                end;
            }
        }
    }
}