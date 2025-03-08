namespace TestProject.TestProject;

page 50100 "Google API Configuration"
{
    ApplicationArea = All;
    Caption = 'Google API Configuration';
    PageType = Card;
    SourceTable = "Google API Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("API Key"; Rec."API Key")
                {
                    ToolTip = 'Specifies the value of the API Key field.', Comment = '%';
                }
                field("Enable Geocoding "; Rec."Enable Geocoding ")
                {
                    ToolTip = 'Specifies the value of the Enable Geocoding field.', Comment = '%';
                }
            }
        }
    }
}
