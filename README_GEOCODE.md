# Business Central Geocoding Integration

This extension integrates Google Maps Geocoding API into Microsoft Dynamics 365 Business Central to automatically fetch latitude/longitude coordinates for customer addresses.

## Prerequisites

1. **Google Cloud Account** with:
   - Billing enabled
   - [Geocoding API enabled](https://console.cloud.google.com/apis/library/geocoding-backend.googleapis.com)
   - API key created with Geocoding permissions

2. Business Central Environment:
   - Version 20.0 or later
   - Permissions to install extensions

## Installation

1. Deploy the AL extension to your Business Central environment:
   - Via VS Code AL project (build & publish)
   - Or upload the `.app` file through the Business Central admin center

## Configuration

### Step 1: Add Google API Key
1. Navigate to **Google API Configuration** page:
   - Search for "Google API Configuration" in the Role Center
   - Or go to **Departments > Administration > Application Setup > Google API Configuration**

2. Enter your Google API Key:  AIzaSy############################
3. Enable geocoding:
- Toggle **"Enable Geocoding"** switch to **Yes**
4. Save changes

### Step 2: Verify Customer Address Format
Ensure customer records have complete addresses with:
- Street Address
- City
- Postal Code
- Country/Region Code

Example valid address: 
Address: 264 George St
City: Sydney
Post Code: 2000
Country/Region Code: AU



## Usage

1. Open any **Customer Card**
2. Verify/Add complete address information
3. Click **Get Coordinates** action (under Process group)
4. System will:
   - Show success message with coordinates
   - Auto-populate Latitude/Longitude fields

![Geocoding Action Demo](https://via.placeholder.com/600x400?text=Click+Get+Coordinates+to+Fetch+Lat/Lng)

## Troubleshooting

### Common Errors

| Error Message | Solution |
|---------------|----------|
| "Geocoding disabled" | Enable toggle in Google API Configuration |
| "No results found" | Check address completeness and formatting |
| "HTTP error 403" | Verify API key validity and billing setup |
| "Invalid JSON response" | Check network connectivity to Google API |

