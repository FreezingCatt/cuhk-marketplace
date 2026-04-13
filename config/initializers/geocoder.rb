Geocoder.configure(
  timeout: 3,
  lookup: :nominatim,
  ip_lookup: :ipinfo_io,
  language: :en,
  http_headers: {
    "User-Agent" => "CUHK Marketplace App (your-email@example.com)"
  },
  use_https: true
)
