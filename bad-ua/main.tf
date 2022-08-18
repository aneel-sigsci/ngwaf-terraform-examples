
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

resource "sigsci_corp_signal_tag" "bad-ua" {
  short_name  = "bad-ua"
  description = "Known bad User Agents"
}

resource "sigsci_corp_list" "bad-ua" {
    name = "Bad UA"
    type = "wildcard"
    entries = [
        "*[Cc][Uu][Rr][Ll]*",
        "*[Pp][Yy][Tt][Hh][Oo][Nn]*",
        "*[Ww][Pp][Ss][Cc][Aa][Nn]*",
        "*[Nn][Mm][Aa][Pp]*",
        "*[Mm][Aa][Ss][Ss][Cc][Aa][Nn]*",
    ]
}

resource "sigsci_corp_rule" "bad-ua" {
  site_short_names = []
  type = "request"
  corp_scope = "global"
  enabled = true
  group_operator = "all"
  reason = "Bad User Agents Blocking Rule"
  expiration = ""

  conditions {
    type     = "single"
    field    = "useragent"
    operator = "inList"
    value = "corp.bad-ua"
  }

  actions {
    type = "block"
  }

  actions {
    type = "addSignal"
    signal = "corp.bad-ua" 
  }
}
