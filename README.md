# ⏰ TimeTick 🚀

Welcome to **TimeTick**! This awesome Bash script lets you track time right from your terminal! 🖥️ Record when you start something with `-s` and check how long it’s been with `-e`. Perfect for timing tasks, study sessions, or just flexing your Bash skills! 😎

---

## ✨ Features
- 🕒 **Start Time**: Save the current time with `-s` and store it in a file.
- ⏱️ **Elapsed Time**: Use `-e` to see how many minutes have passed since the start.
- 🕰️ **Pretty Output**: Shows start/end times in `HH:MM` and total minutes with cool colors! 🎨
- 🌙 **Next-Day Handling**: Automatically adjusts if the end time is on the next day.
- 🚨 **Error Checks**: Catches mistakes like missing start times or wrong commands.

---

## 🛠️ Prerequisites
- 🐧 Bash shell (works on Linux, macOS, or WSL on Windows).
- ✍️ Write permissions in the script’s directory (to create `Stime.txt`).
- A love for terminal adventures! 💖

---

## 📦 Installation
1. Save the script as `timetick.sh`. 📜
2. Make it executable with some terminal magic:
   ```bash
   chmod +x timetick.sh
