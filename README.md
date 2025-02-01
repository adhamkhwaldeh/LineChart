
# Line chart

# Integration Guide: Line chart

## Table of Contents

1. [Introduction]
2. [Prerequisites]
3. [Setup Instructions]
    1. [Step 1: Setup the environment]
    2. [Step 2: Configure the Integration]
    3. [Step 3: Test the Integration]
4. [Features]
5. [Enhancements]
6. [Demo]
7. [Authentication]
8. [API Reference]
9. [Common Errors & Troubleshooting]
10. [FAQs]
11. [Support]

---

## Introduction

This guide provides step-by-step instructions for integrating [Line chart] into your project.
Follow the instructions to quickly get started and connect your system with [Line chart].

---

## Prerequisites

Before you begin the integration process, make sure you have the following:

- A ApiKey service from Line chart
- Access to your [system’s] configuration settings

## Setup Instructions

    - Use Visual studio code and any preferable IDE
    - Flutter (Channel stable, 3.27.3)
    - Android Studio (version 2024.2)
    - Android devices (Android SDK version 35.0.0)

### Step 1: Install Dependencies

Start by installing the required dependencies to your project.
    - Flutter pub get

### Step 2: Configure the Integration

    You can use the fixed data in the application or create api service to match the solution.
    Within class Env you have a useMockedApi property.

    To use mocked data set useMockedApi = true as it is by default.
        static final EnvData dev = EnvData(
            debug: true,
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            debugApiClient: true,
            useMockedApi: true,
            // apiBaseUrl: ApiConfiguration.propertyManBaseUrl,
            // apiBaseUrl: "http://localhost:3000/",
            apiBaseUrl: "http://192.168.255.237:3000/",
        );

### Step 3: Test the Integration

   Just run Run the application on your device or browser.

## Features

    01-Graph and Data Visualization (required design)
    02-Fetch the data
    03-Filter by date
    04-Add switch unit for Watt and KiloWatt
    05-Cache the data according to the criteria ( metric and date)
    06-Add refresh action (with force update) to cover pull and refresh functionality and clear the data.
    07-Cover error messages and connectivity by showing clear messages and refresh options for some cases.
    08-The application supports multiple languages
    09-The application supports dark and light themes
    10-Add data polling option.

## Enhancements
  
  01-Adding pull and refresh option.
  02-I’ve added a toolbar action for force refresh to avoid nested scroll while the graph is scrollable and zoomable.
  03-Enhance the mechanism for polling by adding diffUtil if the data is already updated hence diffUtil can compare between two lists.
  04-In the solution I've tried to make the code as simple as I can avoid creating multiple modules.
  05-I’ve added comments to clarify and explain the project.
  06-The unit tests need enhancement as well.
  07-If the filters were more complex I would implement Riverpod.

## Demo

### Screenshots

- **Dashboard View**

  ![Dashboard View](./screenshots/dashboard.png)
  *A snapshot of the dashboard after integration.*

## Authorization

No authorization is required here

## Api reference

You have to create your own api or use mocked data

## Common Errors & Troubleshooting

<https://github.com/adhamkhwaldeh/LineChart/issues>

## FAQs

<https://github.com/adhamkhwaldeh/LineChart/issues>

## Support

<https://github.com/adhamkhwaldeh/LineChart>
