# Salesforce Experience Cloud for Marketing - Prospect Capture Flow

![Status](https://img.shields.io/badge/status-Beta-yellowgreen)
![Geography](https://img.shields.io/badge/Geography-US-blue)

This Salesforce DX (SFDX) repository contains a Lightning Web Component designed specifically to be used with the new Experience Cloud for Marketing template. This customizable flow is a slick way to capture interest and seamlessly register a prospect with a transition to Experience Cloud for Customers.

# Preview

![Preview of the reg flow](preview.png)

# Prereqs

In order to use this app, you'll need to ensure that you have...

* A Salesforce dev org
* Experience Cloud turned ON (with or without user licenses)
* Knowledge of SFDX
* Some JavaScript skills

NOTE: These components are for Experience Cloud (Communities) only.

## Deploy

Use SFDX, once connected to your Dev org's Dev Hub to deploy the source. The packaged LWCs are built entirely with vanilla JS, HTML, and CSS powered by the static resources included in the repo. The paired Apex classes will be deployed alongside these LWC.

You'll also need to do the following:

1. Make sure your CSP Trusted Settings allow for `https://fc-sfdc-public-assets.s3.us-east-2.amazonaws.com/`.
2. Make sure your Community's guest user is permissioned for the Apex Class `excProspectRegistrationController`.

# To Do

1. Wire up the config for NBA to an actual strategy and pull data from the NBA APIs vs. just hard-coding it with the component config
2. Make the colors and styles configurable via the component config instead of via CSS

# Etc.

Created with love by Frank Caron.