// Supabase connection for cross-device sync.
// Fill in from Supabase Dashboard → Project Settings → API:
//   url     = "Project URL"
//   anonKey = "anon public" key (safe to publish; access is limited by Row Level Security)
// Leave both empty to run without sync (data stays in each browser).
window.SUPABASE_CONFIG = {
  url: '',
  anonKey: ''
};
