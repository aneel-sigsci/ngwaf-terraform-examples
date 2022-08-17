
terraform {
  required_providers {
    sigsci = {
      source = "signalsciences/sigsci"
    }
  }
}

provider "sigsci" {
  //  corp = ""       // Required. may also provide via env variable SIGSCI_CORP
  //  email = ""      // Required. may also provide via env variable SIGSCI_EMAIL
  //  auth_token = "" //may also provide via env variable SIGSCI_TOKEN
}

resource "sigsci_corp_signal_tag" "domain-signal" {
  short_name  = "domain-request"
  description = "Tagging requests to domain"
}

resource "sigsci_corp_list" "domain-list" {
    name = "Domain List"
    type = "wildcard"
    entries = [ // Change values in this list to reflect your domain
        "example.com",
        "*.example.com", 
    ]
}

resource "sigsci_corp_rule" "domain-rule" {
  site_short_names = []
  type = "request"
  corp_scope = "global"
  enabled = true
  group_operator = "all"
  reason = "Identify requests with valid domain in host header"
  expiration = ""

  conditions {
    type     = "single"
    field    = "domain"
    operator = "inList"
    value = "corp.domain-list"
  }

  actions {
    type   = "addSignal"
    signal = "corp.domain-request" 
  }
}
