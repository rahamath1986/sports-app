# Sports Master 🏏

A premium, full-stack sports application featuring real-time cricket insights, AI-enhanced commentary, and a gamified predictive experience.

## 🌟 Key Features

-   **🧠 AI Match Insights**: Live win probability and next-over predictions using manual heuristic formulas.
-   **🎮 Gamified Predictions**: "Predict Next Ball" hybrid model with lag-aware locking and streak bonuses.
-   **🔊 Smart Voice Commentary**: Multi-language TTS (Hindi, Tamil, Malayalam) fueled by an AI text-enhancement layer.
-   **⚡ Ultra-Fast Lite Mode**: One-tap toggle for a minimal, high-speed UI optimized for low-bandwidth areas.
-   **🧑‍🤝‍🧑 Social & Community**: Ready-to-scale chat rooms and meme-sharing capabilities via Supabase.

---

## 🛠 Tech Stack

| Component | Technology |
| :--- | :--- |
| **Frontend** | Flutter (Clean Architecture, Riverpod, Dio, Google Fonts) |
| **Backend** | .NET Core 8 API (Clean Architecture) |
| **Database/Auth** | Supabase (PostgreSQL, Realtime, Auth) |
| **Data Source** | CricketData.org API |
| **Deployment** | Render.com (Dockerized .NET), Supabase |

---

## 🚀 Getting Started

### 🔙 Backend Setup (.NET Core)

1.  Navigate to the backend folder:
    ```bash
    cd backend
    ```
2.  Restore dependencies:
    ```bash
    dotnet restore
    ```
3.  Add your API Key in `appsettings.json` or as an environment variable:
    ```json
    
    ```
4.  Run the server:
    ```bash
    dotnet run --project WebAPI
    ```

### 📱 Frontend Setup (Flutter)

1.  Navigate to the frontend folder:
    ```bash
    cd frontend
    ```
2.  Fetch dependencies:
    ```bash
    flutter pub get
    ```
3.  Generate model/provider code:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
4.  Configure `lib/core/network/api_client.dart` with your backend URL.
5.  Run the app:
    ```bash
    flutter run
    ```

---

## 📂 Project Structure (Clean Architecture)

Both Frontend and Backend follow a strict Clean Architecture pattern:

-   **Domain**: Business logic, entities, and repository interfaces.
-   **Application/Data**: Use cases and data source implementations.
-   **Infrastructure**: External API integrations (CricketData, Supabase).
-   **WebAPI/Presentation**: UI components (Flutter) or Controllers (.NET).

---

## 🚢 Deployment (Render.com)

1.  **Backend**: Use the provided `backend/Dockerfile`.
2.  **Build Context**: Set to `backend/`.
3.  **Env Vars**: Ensure `ASPNETCORE_URLS=http://+:10000` is set.
4.  **Frontend**: Build for Web/Android/iOS as usual.

---

## 🗺 Roadmap (Next Steps)

1.  **Live WebSockets**: Replace polling with SignalR for backend-to-frontend streaming.
2.  **Leaderboard Backend**: Fully implement the Supabase score tracking logic.
3.  **Video Highlights**: Integrate auto-generating clip previews via RapidAPI.
4.  **Fantasy Helper**: Implement the "Team Generator" algorithm using historic player stats.

---

## 📄 License

Created by **Antigravity AI** for the user. MIT License.
