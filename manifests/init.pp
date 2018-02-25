class razer {
  if $::razer_game_scanner_service {
    # razer game scanner service
    service { 'Razer Game Scanner Service':
      ensure => stopped,
      enable => false,
    }
  }

  if $::razer_chroma_sdk_service {
    # razer game chroma SDK service
    service { 'Razer Chroma SDK Service':
      ensure => stopped,
      enable => false,
    }
  }

  if $::razer_chroma_sdk_server {
    # razer game chroma SDK server
    service { 'Razer Chroma SDK Server':
      ensure => stopped,
      enable => false,
    }
  }
}
