
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

resource "sigsci_corp_signal_tag" "ofac" {
  short_name  = "ofac"
  description = "Countries on OFAC list"
}

resource "sigsci_corp_list" "ofac" {
    name = "OFAC Countries"
    type = "country"
    entries = [
        "IR",
        "SY",
        "SD",
        "KP",
        "BY",
        "CI",
        "CU",
        "CD",
        "IQ",
        "LR",
        "MM",
        "ZW",
    ]
}

resource "sigsci_corp_rule" "ofac" {
  site_short_names = []
  type = "request"
  corp_scope = "global"
  enabled = true
  group_operator = "all"
  reason = "OFAC Country Blocking Rule"
  expiration = ""

  conditions {
    type     = "single"
    field    = "country"
    operator = "inList"
    value = "corp.ofac-countries"
  }

  actions {
    type = "block"
  }

  actions {
    type = "addSignal"
    signal = "corp.ofac" 
  }
}
