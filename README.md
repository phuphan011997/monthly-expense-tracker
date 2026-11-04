# Monthly Expense Tracker

Mobile-first web app for tracking monthly income and expenses (Vietnamese UI: "Sổ Thu Chi").

## Features
- Per-user accounts (register / log in); each account has its own ledger
- Recurring income & expenses (salary, rent…): entered once, repeat every month; edits apply from a chosen month onward without changing earlier months
- One-off income (business, investment…) and expenses
- Dashboard: monthly summary, KPI cards, trend charts, category breakdown, auto insights, largest items table
- Statistics: 3/6/12-month comparisons, fixed vs. variable, cumulative spending, savings rate, per-category trend
- Zoom locked and touch-friendly for phones; dark (default) and light themes
- Demo mode (no sign-up) and demo account `demo` / `demo123`

## Tech
Static site: `index.html` (plain HTML, CSS and JavaScript) and `config.js`, with [Chart.js](https://www.chartjs.org/) 4.4.1 and [supabase-js](https://supabase.com/docs/reference/javascript) 2.45.4 from CDNs. No build step.

Storage has two modes:

- **Supabase sync** (when `config.js` is filled in): email/password accounts via Supabase Auth; each user's data lives in the `ledger_docs` table protected by Row Level Security, so it syncs across phone and desktop. Data from the device-only mode can be imported into an account.
- **Device only** (when `config.js` is empty): accounts and data stay in the browser's `localStorage`; passwords are salted and hashed with SHA-256.

## Set up Supabase sync
1. Create a project at [supabase.com](https://supabase.com).
2. SQL Editor → New query → paste [`supabase/schema.sql`](supabase/schema.sql) → **Run**.
3. Authentication → URL Configuration: set **Site URL** to your deployed URL (used in confirmation and password-reset emails).
4. Project Settings → API: copy **Project URL** and the **anon public** key into [`config.js`](config.js). The anon key is meant to be public; Row Level Security limits each user to their own rows.
5. Commit and push; Vercel redeploys.

## Run locally
Open `index.html` in a browser, or serve the folder:

```bash
npx serve .
```

## Deploy
Static hosting: on Vercel import the repo with Framework Preset **Other** and no build command.
