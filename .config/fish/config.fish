if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Fish settings
set -gx fish_greeting ""
## Fish colors
set fish_color_autosuggestion brblack
set fish_color_cancel white
set fish_color_command green
set fish_color_comment cyan
set fish_color_cwd blue
set fish_color_end magenta
set fish_color_error red
set fish_color_escape white
set fish_color_host magenta
set fish_color_host_remote red
set fish_color_keyword yellow
set fish_color_normal normal
set fish_color_operator magenta
set fish_color_option blue
set fish_color_param normal
set fish_color_quote blue
set fish_color_redirection cyan
set fish_color_search_match normal
set fish_color_selection blue
set fish_color_user yellow
set fish_key_bindings fish_default_key_bindings
set fish_pager_color_background normal
set fish_pager_color_completion normal
set fish_pager_color_description normal
set fish_pager_color_prefix blue
set fish_pager_color_progress normal
set fish_pager_color_secondary_background normal
set fish_pager_color_secondary_completion normal
set fish_pager_color_secondary_description normal
set fish_pager_color_secondary_prefix blue
set fish_pager_color_selected_background --background=A1B0B8
set fish_pager_color_selected_completion 151515
set fish_pager_color_selected_description 151515
set fish_pager_color_selected_prefix 151515

set -gx DXVK_HUD fps
alias edit-fish-config="nano $HOME/.config/fish/config.fish"
alias disable-pstate="sudo bash -c 'echo passive >  /sys/devices/system/cpu/intel_pstate/status'"
alias enable-pstate="sudo bash -c 'echo active >  /sys/devices/system/cpu/intel_pstate/status'"
alias schedutil-tweak="sudo bash -c 'echo 0 > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us'"
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias memstats="watch -n 0.5 cat /proc/meminfo"
alias mic-latency-fix="pw-cli s 49 Props '{ params = [ "api.alsa.headroom" 256 ] }'"
alias mirror-phone="scrcpy -b 10M --max-fps 60 -w -S"
alias normalize-MONKE='find . -name \*.ape -execdir loudgain -a -k -s e "{}" +'
alias normalize-m4a='find . -name \*.m4a -execdir loudgain -a -k -s e "{}" +'
alias vscode-folder-fix="gio mime inode/directory org.gnome.Nautilus.desktop"
alias vmware-modules-fix="sudo CPATH=/usr/src/kernels/$(uname -r)/include/linux vmware-modconfig --console --install-all"
alias gpu-stats="sudo intel_gpu_top"
alias zswap_stats="sudo (which zswap-stats)"
alias dl-music-wav="yt-dlp -x --audio-format wav --audio-quality 0"
alias dl-music="yt-dlp -x --audio-quality 0"
alias mangohud-intel-workaround="sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj && echo 'Remember to run disable-mangohud-intel-workaround!'"
alias disable-mangohud-intel-workaround="sudo chmod o-r /sys/class/powercap/intel-rapl\:0/energy_uj"

# Games
alias oblivion="cd '/mnt/c0ef2aa8-4731-4f40-8d73-ccd76c1c532e/Games/Windows/MO2 Instances/Oblivion/' && WINEPREFIX=/home/mt/.games/ wine ModOrganizer.exe && cd "
alias genshin="cd .games/drive_c/Program\ Files/Genshin\ Impact/Genshin\ Impact\ game/ && WINEPREFIX=/home/mt/.games wine GenshinImpact.exe && cd"
alias hp2010="cd .games/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/Need\ for\ Speed\ Hot\ Pursuit/ && WINEPREFIX=/home/mt/.games/ wine NFS11.exe && cd"
alias ff12="cd .games/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/FINAL\ FANTASY\ XII\ THE\ ZODIAC\ AGE/x64/ && WINEPREFIX=/home/mt/.games wine FFXII_TZA.exe && cd"
