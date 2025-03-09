namespace TestProject.TestProject;

page 50100 "Google API Configuration"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Google API Setup";
    Caption = 'Google API Configuration';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("API Key"; Rec."API Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter your Google Maps API Key';
                    ExtendedDatatype = Masked;
                }
                field("Enable Geocoding "; Rec."Enable Geocoding")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enable/disable geocoding functionality';
                }
            }
        }
    }

    // Ensure the setup record exists when the page opens
    trigger OnOpenPage()
    begin
        // Call the GetSetup() method to handle record existence
        Rec.GetSetup();
    end;
}
