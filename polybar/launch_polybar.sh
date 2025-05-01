#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar


# launch 1 bar
# echo "---" | tee -a /tmp/polybar1.log
# polybar bar_config1 2>&1 | tee -a /tmp/polybar1.log & disown

# launch 2 bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar_config1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar_config2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
