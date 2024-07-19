#/bin/bash
workflow upload "$(echo ~/Desktop/$(ls -t ~/Desktop/ | grep -e "png" -e "gif" | head -1))"
