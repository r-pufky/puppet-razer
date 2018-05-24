# Detect razer gaming services

powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
command = "if (Get-Service '%s' -ErrorAction SilentlyContinue) { Write-Host 'true' }"

Facter.add(:razer) do
  confine :kernel => :windows
  setcode do
    razer = {}

    service = command % 'Razer Chroma SDK Server'
    razer['chroma_sdk_server'] = Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"

    service = command % 'Razer Chroma SDK Service'
    razer['chroma_sdk_service'] = Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"
    
    service = command % 'Razer Game Scanner Service'
    razer['game_scanner_service'] = Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"

    razer
  end
end

Facter.add(:razer) do
  confine :kernel => :linux
  setcode do
    razer = {
      'chroma_sdk_server' => false,
      'chroma_sdk_service' => false,
      'game_scanner_service' => false,
    }
  end
end
