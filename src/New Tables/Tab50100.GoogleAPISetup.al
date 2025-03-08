table 50100 "Google API Setup"
{
    Caption = 'Google API Setup';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "API Key"; Text[100])
        {
            Caption = 'API Key';
        }
        field(2; "Enable Geocoding "; Boolean)
        {
            Caption = 'Enable Geocoding ';
        }

    }
    keys
    {
        key(PK; "API Key")
        {
            Clustered = true;
        }
    }
}
