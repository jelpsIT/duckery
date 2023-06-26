# Function to simulate slower cursor movement with lag
function SlowDownCursorWithLag {
    Write-Host "Slowing down the cursor movement with lag..."
    Write-Host "Press Ctrl+C to exit the cursor slowdown."

    while ($true) {
        Start-Sleep -Milliseconds 500

        # Add lag effect by pausing the script execution for a short duration
        Start-Sleep -Milliseconds 200

        # Update the cursor position after the lag effect
        [System.Windows.Forms.Cursor]::Position = [System.Windows.Forms.Cursor]::Position
    }
}

# Function to simulate slower keystrokes with lag
function SlowDownKeystrokesWithLag {
    Write-Host "Slowing down keystrokes with lag..."
    Write-Host "Press Esc to exit the keystroke slowdown."

    while ($true) {
        # Add lag effect by pausing the script execution for a short duration
        Start-Sleep -Milliseconds 200

        # Read the keystroke input
        $key = $host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 27) {
            break
        }
    }
}

# Function to create a blinking effect on the monitor
function BlinkMonitor {
    Write-Host "Creating a blinking effect on the monitor..."
    Write-Host "Press Ctrl+C to stop the blinking effect."

    while ($true) {
        # Turn off the monitor
        Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class MonitorControl {
            [DllImport("user32.dll")]
            public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
            [DllImport("user32.dll")]
            public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

            private const int WM_SYSCOMMAND = 0x0112;
            private const int SC_MONITORPOWER = 0xF170;
            private const int MONITOR_ON = -1;
            private const int MONITOR_OFF = 2;

            public static void TurnOffMonitor() {
                IntPtr hWnd = FindWindow(null, null);
                SendMessage(hWnd, WM_SYSCOMMAND, (IntPtr)SC_MONITORPOWER, (IntPtr)MONITOR_OFF);
            }

            public static void TurnOnMonitor() {
                IntPtr hWnd = FindWindow(null, null);
                SendMessage(hWnd, WM_SYSCOMMAND, (IntPtr)SC_MONITORPOWER, (IntPtr)MONITOR_ON);
            }
        }
"@

        # Turn off the monitor
        [MonitorControl]::TurnOffMonitor()
        Start-Sleep -Seconds 1

        # Turn on the monitor
        [MonitorControl]::TurnOnMonitor()
        Start-Sleep -Seconds 1
    }
}

# Main script execution

# Invoke the SlowDownCursorWithLag function
SlowDownCursorWithLag

# Invoke the SlowDownKeystrokesWithLag function
SlowDownKeystrokesWithLag

# Invoke the BlinkMonitor function
BlinkMonitor
