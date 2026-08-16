-- Extra autostart processes.
o.launch_on_start("sleep 1; hyprpm reload")
o.launch_on_start("sleep 3; ghostty")
o.launch_on_start("sleep 5; hyprctl dispatch 'hl.dsp.exec_cmd(\"brave\", {workspace=\"2 silent\"})'")
o.launch_on_start("sleep 7; hyprctl dispatch 'hl.dsp.exec_cmd(\"zeditor\", {workspace=\"3 silent\"})'")
