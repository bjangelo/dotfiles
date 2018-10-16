#!/bin/sh
IMAGE=/home/bangelo/.config/i3/lock.png
scrot "$IMAGE"
mogrify -scale 3% -scale 3344% "$IMAGE"
i3lock -i "$IMAGE"