# AGENTS.md — Alba Intelligence Hugo Site

## What this is
Hugo static site (marketing site for Alba Intelligence). Pages are composed of "brick" shortcodes. No app backend, no tests, no lint.

## Key commands
- Dev server: `hugo server` (or `hugo server -D` to include drafts)
- Production build: `hugo --minify`
- Nix shell: `nix develop` (provides hugo, imagemagick, npm); `.envrc` uses `use devenv`

## Architecture
- `config.yaml` — single Hugo config (no `hugo.toml`). English enabled, French disabled.
- `themes/hugobricks/` — the theme (committed directly to this repo, **not** a git submodule). Contains layouts, partials, and shortcodes.
- `content/en/` — page markdown files composed with brick shortcodes (`{{< brick_intro >}}`, `{{< brick_image >}}`, etc.)
- `data/en/*.yaml` — site data (header nav, contact form config, general settings, people, footer). Driven by `data/settings.yaml`.
- `static/` — uploads (`/uploads/`), CSS, Google verification file.
- `_unused/` — legacy content/data, not used by the live site.

## CI / deployment
- `.github/workflows/hugo.yml` — builds with Hugo **v0.128.0**, installs Dart Sass via snap, deploys to GitHub Pages on push to `main`.
- `HUGO_ENVIRONMENT=production` is set during CI builds.

## Gotchas
- `.gitmodules` is stale: references `themes/zeon_studio_hugoplate` (does not exist). The real theme is `themes/hugobricks`, tracked directly in this repo.
- Contact form action is `/form.php` — no backend handler in this repo.
- `unsafe: true` is set in goldmark renderer (HTML in markdown is allowed).
- `assetDir: static` — Hugo looks for assets in `static/`, not `assets/`.
