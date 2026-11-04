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
Single static `index.html`: plain HTML, CSS and JavaScript, with [Chart.js](https://www.chartjs.org/) 4.4.1 from cdnjs. No build step.

Data is stored in the browser's `localStorage` (per device). Passwords are salted and hashed with SHA-256 before storage.

## Run locally
Open `index.html` in a browser, or serve the folder:

```bash
npx serve .
```

## Deploy
Static hosting: on Vercel import the repo with Framework Preset **Other** and no build command.
