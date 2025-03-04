namespace TestProject.TestProject;

using Microsoft.Inventory.Item;

report 50100 "Item Test"
{
    ApplicationArea = All;
    Caption = 'Item Test';
    UsageCategory = ReportsAndAnalysis;
    WordLayout = './ItemTest.docx';
    dataset
    {
        dataitem(Item; Item)
        {
            column("Description"; "Description")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
