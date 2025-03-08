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
            }
            field(Longitude; Rec.Longitude)
            {
                ApplicationArea = All;
            }
        }
    }
}