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

resource "sigsci_corp_signal_tag" "malicious-attacker" {
  short_name  = "malicious-attacker"
  description = "Identification of attacks from malicious IPs"
}

resource "sigsci_corp_rule" "malicious-attacker" {
  site_short_names = []
  type            = "request"
  corp_scope      = "global"
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
  }
    actions {
    type = "addSignal"
    signal = "corp.malicious-attacker" 
  }
}
