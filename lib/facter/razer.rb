# Detect razer gaming services

powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
command = "if (Get-Service '%s' -ErrorAction SilentlyContinue) { Write-Host 'true' }"

Facter.add('razer_chroma_sdk_server') do
  confine :kernel => :windows
  setcode do
    service = command % 'Razer Chroma SDK Server'
    Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"
  end
end

Facter.add('razer_chroma_sdk_service') do
  confine :kernel => :windows
  setcode do
    service = command % 'Razer Chroma SDK Service'
    Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"
  end
end

Facter.add('razer_game_scanner_service') do
  confine :kernel => :windows
  setcode do
    service = command % 'Razer Game Scanner Service'
    Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"
  end
end
