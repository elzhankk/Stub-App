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


![simulator_screenshot_1640B11D-305D-4323-B056-373FA7869AB0](https://github.com/user-attachments/assets/ff825b04-7634-437f-aa63-2367ae91f8f7)


![simulator_screenshot_7455AAFE-6BFB-4127-9366-24A8C66A06D2](https://github.com/user-attachments/assets/dbcfec61-d352-4b38-a288-0c36eac38cc1)

