-- Extra autostart processes.
o.launch_on_start("sleep 1; hyprpm reload")
o.launch_on_start("sleep 3; ghostty")
o.launch_on_start("sleep 4; hyprctl dispatch 'hl.dsp.exec_cmd(\"brave\", {workspace=\"2 silent\"})'")
o.launch_on_start("sleep 9; hyprctl dispatch 'hl.dsp.exec_cmd(\"zeditor\", {workspace=\"3 silent\"})'")
