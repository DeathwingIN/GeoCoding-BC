table 50100 "Google API Setup"
{
    Caption = 'Google API Setup';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "API Key"; Text[100])
        {
            Caption = 'Google API Key';
            DataClassification = CustomerContent;
        }
        field(3; "Enable Geocoding"; Boolean)
        {
            Caption = 'Enable Geocoding';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    // Initialize the setup record on first use
    procedure GetSetup()
    begin
        // Check if the current instance (Rec) has the setup record.
        if not Get('GOOGLE') then begin
            // If not, initialize and insert it.
            Init();
            "Primary Key" := 'GOOGLE';
            Insert(true);
        end;
    end;
}
