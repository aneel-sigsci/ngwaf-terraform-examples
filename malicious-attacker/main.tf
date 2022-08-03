terraform {
  required_providers {
    sigsci = {
      source = "signalsciences/sigsci"
    }
  }
}

provider "sigsci" {
    corp = "[corp-shortname]"       // Required. may also provide via env variable SIGSCI_CORP
  //  email = ""      // Required. may also provide via env variable SIGSCI_EMAIL
  //  auth_token = "" //may also provide via env variable SIGSCI_TOKEN
}

resource "sigsci_site_rule" "test" {
  site_short_name = "test"
  type            = "request"
  group_operator  = "all"
  enabled         = true
  reason          = "Blocking attacks from known Malicious IPs"
  expiration      = ""


  conditions {
    type     = "multival"
    field    = "signal"
    group_operator = "any"
    operator = "exists"
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "USERAGENT"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "BACKDOOR"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "CMDEXE"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "SQLI"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "TRAVERSAL"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "XSS"
    }
  }

    conditions {
    type     = "multival"
    field    = "signal"
    group_operator = "any"
    operator = "exists"
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "SIGSCI-IP"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "TORNODE"
    }
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "SANS"
    }
  }

  actions {
    type = "block"
    signal = "corp.malicious-attacker" 
  }
}
