🧩 Logic: Displaying WebView vs. Stub UI
The app implements conditional logic to switch between a WebView screen and the standard app interface (stub UI), based on values fetched from Firebase Remote Config.

🔹 Remote Config Parameters
needForceUpdate: true or false

redirectLink: a URL string (e.g., https://en.wikipedia.org/wiki/The_Lord_of_the_Rings)

📲 Behavior on App Launch
Condition	What the app displays
🔴 needForceUpdate = true	The app immediately shows a WebView with the URL from redirectLink. The normal app UI (tab bar, character list) is not shown.
🟢 needForceUpdate = false	The app shows the standard UI (“stub”): TabBar with the character list and detail screens.
📶 Firebase not available but saved link exists	The app opens the WebView using the saved link from UserDefaults as if needForceUpdate = true.

💾 Link Persistence
When redirectLink is first fetched, the app saves it to UserDefaults. If the network is unavailable later, the app can still load the saved link and show the WebView

Characters View
![Simulator Screenshot1](https://github.com/user-attachments/assets/e273d1a6-857b-4144-a52b-b1c7231968e5)


Detail View
![Simulator Screenshot2](https://github.com/user-attachments/assets/27b60275-3b5e-4ea5-8900-4e399cc48222)



