# OFAC List Rule

This Terraform file will build a list and a request rule that identifies requests from countries on the OFAC list. [OFAC](https://home.treasury.gov/policy-issues/office-of-foreign-assets-control-sanctions-programs-and-information) is the Office of Foreign Assets Control, under the US Department of Treasury.

A list will be created with countries on the OFAC list:

![ofac_country_list](https://user-images.githubusercontent.com/45185884/188759538-c9aa91bf-e8f9-43f3-a8bc-459ed4b4493d.png)

Then a request rule will be created using the list to block requests from countries on the above list:

![ofac_rule](https://user-images.githubusercontent.com/45185884/185006406-5f27b776-9ea1-45dc-bd3c-d479f517fff3.png)
