#!/bin/sh
function htmlify() {
  echo "<span color='red'>`/home/qmp/.config/awesome/scripts/task_reader.sh high`</span>"
  echo "<span color='black'>`/home/qmp/.config/awesome/scripts/task_reader.sh normal`"
  echo "</span><span color='grey'>`/home/qmp/.config/awesome/scripts/task_reader.sh low`</span>"

}

htmlify > /tmp/thunder_task_cache
