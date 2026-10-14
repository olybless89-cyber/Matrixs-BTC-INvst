# Matrixs BTC — Investment Platform (Demo)

A full-stack web app scaffolded as a fresh deployment for **Railway**. It includes a
polished landing page, real authentication (sign up / sign in), a simulated market feed,
and a portfolio dashboard.

> This is a demonstration scaffold. All prices and balances are **simulated**. It does not
> touch a real exchange and no real money or deposits are involved.

## Stack

- Node.js 18+ and **Express** (the only runtime dependency)
- Vanilla HTML / CSS / JavaScript frontend — no build step, no framework
- JSON file storage (`data/store.json`)
- Password hashing with `crypto.scryptSync`, server-side sessions via HttpOnly cookies

## Features

- **Landing page** with a live (simulated) market snapshot and scrolling ticker
- **Auth**: sign-up and sign-in with scrypt-hashed passwords and server sessions
- **Dashboard**: virtual portfolio (buy/sell against simulated prices), holdings with P&L,
  live market table
- Content pages: **Pricing, About, FAQ, Contact, 404**
- Fully containerised and configured for **Railway** auto-deploy

## Run locally

```bash
npm install
npm start
```

Open <http://localhost:3000>. Set `PORT` to change the port:

```bash
PORT=8080 npm start
```

## Layout

```
server/
  index.js     Express app: API routes, static hosting, sessions
  store.js     users, sessions, holdings, scrypt password hashing
  markets.js   simulated price engine (random walk)
public/
  index.html   landing page
  login.html / signup.html
  dashboard.html
  pricing.html / about.html / faq.html / contact.html / 404.html
  css/app.css
  js/app.js
```

## API

| Method | Path                   | Notes                                  |
| ------ | ---------------------- | -------------------------------------- |
| GET    | `/api/markets`         | Simulated market list                  |
| POST   | `/api/auth/signup`     | Create account, starts a session       |
| POST   | `/api/auth/login`      | Sign in                                |
| POST   | `/api/auth/logout`     | End the session                        |
| GET    | `/api/auth/me`         | Current user, or `null`                |
| GET    | `/api/portfolio`       | Portfolio for the signed-in user       |
| POST   | `/api/portfolio/trade` | Simulated buy/sell (`symbol`, `side`, `usd`) |
| POST   | `/api/portfolio/reset` | Reset to $10,000 virtual cash          |

## Deploy to Railway

1. Push this repository to GitHub.
2. Go to [railway.app](https://railway.app), start a **New Project** → **Deploy from GitHub repo**.
3. Select this repository — Railway auto-detects the `Dockerfile` and runs `npm start`.
4. On the service, go to **Settings → Networking → Generate Domain** to get your live URL.
5. Optional: Point your own domain at the generated URL in the **Networking** tab.

Railway auto-redeploys on every push to the linked branch.