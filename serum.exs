%{
  site_name: "Carlo Ascani personal website.",
  site_description: "The personal website of Carlo Ascani, a web developer.",
  date_format: "{WDfull}, {D} {Mshort} {YYYY}",
  base_url: "/",
  author: "Carlo Ascani",
  author_email: "carlo.ratm@gmail.com",
  posts_source: "",
  tags_path: "",
  plugins: [
    {Serum.Plugins.LiveReloader, only: :dev}
  ]
}
