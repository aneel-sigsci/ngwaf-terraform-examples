# OFAC List Rule

This Terraform file will build a list and a request rule that identifies requests from countries on the OFAC list. [OFAC](https://home.treasury.gov/policy-issues/office-of-foreign-assets-control-sanctions-programs-and-information) is the Office of Foreign Assets Control, under the US Department of Treasury.

A list will be created with countries on the OFAC list:


Then a request rule will be created using the list to block requests from countries on the above list:
