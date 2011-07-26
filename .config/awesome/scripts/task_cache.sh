#!/bin/sh
function htmlify() {
  echo "<span color='red'>`/home/qmp/.config/awesome/scripts/task_reader.sh high`</span>"
  echo "<span color='cyan'>`/home/qmp/.config/awesome/scripts/task_reader.sh normal`"
  echo "</span><span color='white'>`/home/qmp/.config/awesome/scripts/task_reader.sh low`</span>"

}

htmlify > /tmp/thunder_task_cache
