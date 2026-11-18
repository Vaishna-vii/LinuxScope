#!/bin/bash
if [ ! -f "./advisor" ]; then
    gcc advisor.c -o advisor
fi
./advisor
echo ""
echo -e "\033[33mPress Enter to return to the menu...\033[0m"
read
