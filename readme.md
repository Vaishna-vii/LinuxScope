🐧 LINUXSCOPE
Linux-Based System Health Monitoring System
A lightweight, menu-driven system monitoring tool built with Bash scripting and C.

LINUXSCOPE brings essential Linux diagnostics into one terminal-based application. It displays system information, monitors resource usage, lists active processes, reports threshold-based alerts, and stores timestamped monitoring logs.
✨ Features
- 🖥️ System Information — View hostname, kernel version, and uptime.
- ⚙️ CPU Monitoring — Check current CPU utilization.
- 🧠 Memory Monitoring — View RAM and swap usage.
- 💾 Disk Monitoring — Inspect filesystem usage.
- 🌐 Network Monitoring — Display IP address and default network interface.
- 📊 Process Monitoring — List processes ranked by CPU and memory usage.
- ❤️ System Health — View system load and memory statistics.
- 🚨 System Alerts — Get warnings when CPU, memory, or disk usage crosses the configured threshold.
- 🔄 Full System Monitor — Run the monitoring modules sequentially.
- 📝 Timestamped Logging — Save monitoring reports in logs/ when exiting the application.
- 💡 C Advisor — Run a rule-based advisor that checks system metrics and displays performance suggestions.
🧰 Tech Stack
Technology	Purpose
Bash	Menu, module execution, automation, and logging
C	Rule-based system advisor
Linux utilities	Collect system and process information
GCC	Compile the C advisor


Utilities used: top, free, df, ps, hostname, uname, uptime, ip, awk, grep, cut, tr, and date.
🏗️ Project Structure
LINUXSCOPE/
│
├── menu.sh                 # Main menu and navigation
├── system_info.sh          # Hostname, kernel, and uptime
├── cpu_monitor.sh          # CPU utilization
├── memory_monitor.sh       # RAM and swap statistics
├── disk_monitor.sh         # Filesystem usage
├── network_monitor.sh      # IP address and network interface
├── process_monitor.sh      # Top CPU- and memory-consuming processes
├── health_monitor.sh       # System load and memory overview
├── alert_monitor.sh        # Resource threshold alerts
├── summary.sh              # Runs monitoring modules sequentially
├── logger.sh               # Generates timestamped log reports
├── advisor.c               # C-based rule advisor
├── advisor_wrapper.sh      # Compiles and runs the advisor
├── advisor                 # Compiled executable (generated)
└── logs/                   # Saved monitoring reports
🚀 Getting Started
1. Clone the repository
git clone <repository-url>
cd LINUXSCOPE
2. Make the shell scripts executable
chmod +x *.sh
3. Check dependencies
Make sure Bash, standard Linux utilities, and GCC are available.

On Ubuntu/Debian:
sudo apt update
sudo apt install build-essential procps coreutils
4. Run LINUXSCOPE
./menu.sh
The C advisor is compiled by advisor_wrapper.sh when it runs, provided GCC is installed.
🧭 How It Works
1. Run menu.sh to open the interactive, color-coded menu.
2. Select an individual monitoring option to execute its corresponding Bash script.
3. Choose Run Full Monitor to execute the monitoring modules in sequence through summary.sh.
4. Choose Exit to trigger the logging step and run the C-based advisor.
5. The generated timestamped report is stored in logs/.
📄 Log files
Log filenames follow this pattern:
logs/sys_YYYY-MM-DD_HH-MM-SS.log
Each report contains the outputs of the monitoring modules captured by logger.sh.
🧩 Architecture
                 ┌──────────────────┐
                 │     menu.sh      │
                 │    Main Menu     │
                 └────────┬─────────┘
                          │
          ┌───────────────┼────────────────┐
          │               │                │
          ▼               ▼                ▼
   Individual        summary.sh        Exit option
   monitor scripts   Full Monitor          │
          │               │                ▼
          │        Runs modules        logger.sh
          │        sequentially            │
          │                                ▼
          │                           logs/*.log
          │
          └────────────────────────────────┐
                                           ▼
                                  advisor_wrapper.sh
                                           │
                                           ▼
                                       advisor.c
                                   C-based Advisor
⚠️ Current Scope & Limitations
- Monitors the local Linux machine only.
- CPU utilization is a snapshot, not a long-term average.
- Alert thresholds are fixed in the current implementation.
- The tool reports issues but does not automatically resolve them.
- Output may vary across Linux distributions and system configurations.
- Continuous monitoring, remote-host monitoring, and graphical dashboards are not currently included.
🔮 Future Enhancements
- ⏱️ Add user-configurable periodic monitoring.
- 🌍 Support remote Linux systems through SSH.
- 🔔 Add desktop or email notifications for alerts.
- 📈 Visualize historical data from saved logs.
- 🛠️ Improve portability and handling of missing commands or unavailable interfaces.

📚 References
- GNU Bash Reference Manual
- GNU Coreutils Manual
- Linux manual pages for top, free, df, ps, ip, and uptime.
<p align="center">
  Made with 🐧 Bash, C, and Linux
</p>