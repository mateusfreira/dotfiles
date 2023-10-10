#/bin/bash
workflow upload "$(echo ~/Desktop/$(ls -t ~/Desktop/ | grep png | head -1))"
