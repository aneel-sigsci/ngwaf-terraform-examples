# Terraform Examples

This repository contains examples of configuring the NGWAF (Powered by Signal Sciences) using Terraform.

## Prerequisites

We will need to authenticate and provide the shortname for the Corp. In order to authenticate you need the e-mail address of the account used to authenticate to the Signal Sciences Dashboard and an API token for the account.

To authenticate, set the environment variables for e-mail and API token:

`export SIGSCI_EMAIL="[your-email]"`

`export SIGSCI_TOKEN="[your-api-token]"`

Next, set the environment variable for the Corp name:

`export SIGSCI_CORP="[your-corp-shortname]"`
