class razer {
  if $::razer[game_scanner_service] {
    service { 'Razer Game Scanner Service':
      ensure => stopped,
      enable => false,
    }
  }

  if $::razer[chroma_sdk_service] {
    service { 'Razer Chroma SDK Service':
      ensure => stopped,
      enable => false,
    }
  }

  if $::razer[chroma_sdk_server] {
    service { 'Razer Chroma SDK Server':
      ensure => stopped,
      enable => false,
    }
  }
}
