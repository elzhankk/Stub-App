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


  ![Simulator Screenshot2](https://github.com/user-attachments/assets/168aa98f-0566-4f67-83ed-76f168b1e4e2)

         


Detail View


  ![Simulator Screenshot1](https://github.com/user-attachments/assets/b6195498-e0ef-4ecc-bd50-a5db0d8b007c)

                 



