# Malicious Attacker

This Terraform file will build a rule that identifies attack requests from known malicious IP's.

The default attack signals as defined as defined here: https://docs.fastly.com/signalsciences/faq/system-tags/#attacks.

As well as the known malicious IP's from SANS, Tor, and SigSci-IP.

The rule should look like this:

![Screen Shot of Rule](https://user-images.githubusercontent.com/45185884/182689862-a6669efd-c3e8-4a89-bd41-191a9c406cd5.png)
