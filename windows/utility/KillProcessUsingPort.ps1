netstat -ano | findstr :8080

# TCP     0.0.0.0:8080    0.0.0.0:0   LISTENING   2660
# TCP     [::]:8080       [::]:0      LISTENING   2660

taskkill /PID 2660 /F

# with npm kill-port

npx kill-port 8080

sudo netstat -abno