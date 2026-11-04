// Supabase connection for cross-device sync.
// Fill in from Supabase Dashboard → Project Settings → API:
//   url     = "Project URL"
//   anonKey = "anon public" key (safe to publish; access is limited by Row Level Security)
// Leave both empty to run without sync (data stays in each browser).
window.SUPABASE_CONFIG = {
  url: 'https://cymlnaaoxwhxguhdskxt.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5bWxuYWFveHdoeGd1aGRza3h0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTM4MDExMjgsImV4cCI6MjEwOTM3NzEyOH0.yOaf-tN5iwepBQMv5a1Z0HDm54QXcFPlMl5UQ38hTig'
};
