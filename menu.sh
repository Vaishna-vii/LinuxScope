#!/bin/bash

CYAN='\033[1;36m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
RESET='\033[0m'

while true
do
    clear
    echo -e "${CYAN}"
    echo "╔═════════════════════════════════════════════╗"
    echo "║                                             ║"
    echo "║                  LINUXSCOPE                 ║"
    echo "║         SYSTEM HEALTH MONITORING TOOL       ║"
    echo "║                                             ║"
    echo "╚═════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e "${BLUE}_______________________________________________${RESET}"
    echo -e "${BLUE}|               MONITORING MODULES            |${RESET}"
    echo -e "${BLUE}|_____________________________________________|${RESET}"
    echo -e "${WHITE}|        [1]System Information                |${RESET}"
    echo -e "${WHITE}|        [2]CPU Monitor                       |${RESET}"
    echo -e "${WHITE}|        [3]Memory Monitor                    |${RESET}"
    echo -e "${WHITE}|        [4]Disk Monitor                      |${RESET}"
    echo -e "${WHITE}|        [5]Network Monitor                   |${RESET}"
    echo -e "${WHITE}|        [6]Process Monitor                   |${RESET}"
    echo -e "${WHITE}|        [7]System Health                     |${RESET}"
    echo -e "${WHITE}|        [8]System Alerts                     |${RESET}"
    echo -e "${BLUE}|_____________________________________________|${RESET}"
    echo -e "${GREEN}|        [9]Run Full Monitor                  |${RESET}"
    echo -e "${RED}|        [10] × Exit                          |${RESET}"
    echo -e "${BLUE}|_____________________________________________|${RESET}"
    echo
    echo -e "${GRAY} Linux System Monitoring • Bash Based${RESET}"
    echo
    echo -ne "${YELLOW} Enter your choice [1-10]: ${RESET}"
    read choice

    case $choice in
        1)
            ./system_info.sh
            ;;
        2)
            ./cpu_monitor.sh
            ;;
        3)
            ./memory_monitor.sh
            ;;
        4)
            ./disk_monitor.sh
            ;;
        5)
            ./network_monitor.sh
            ;;
        6)
            ./process_monitor.sh
            ;;
        7)
            ./health_monitor.sh
            ;;
        8)
            ./alert_monitor.sh
            ;;
        9)
            ./summary.sh
            ;;
        10)
            clear
            echo
            echo "===== SAVING SYSTEM LOG ====="
            bash ./logger.sh
            echo
	    echo "===== C-ADVISOR LOG REVIEW ====="
            ./advisor
	    echo
            echo -e "${GREEN} LINUXSCOPE terminated successfully.${RESET}"
            echo
            exit 0
            ;;
        *)
            echo
            echo -e "${RED} × Invalid choice! Please select 1-10.${RESET}"
            ;;
    esac

    echo -e "${CYAN}_______________________________________________${RESET}"
    echo -e "${YELLOW} Press Enter to return to the main menu...${RESET}"
    read
done
