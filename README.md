# `lab-design.github.io`

This is the source code for the website of the **Laboratory for Software Design**
at Tulane University, part of the School of Science and Engineering. The site is
published at <https://lab-design.github.io/>.

## How the site is built and deployed

The site is built with [Jekyll](https://jekyllrb.com/), a static site generator
written in Ruby, using the [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar)
and [jekyll-paginate](https://github.com/jekyll/jekyll-paginate) plugins.

Source lives on the **`development`** branch. A GitHub Actions workflow
(`.github/workflows/gem-push.yml`) builds the site and publishes the generated
HTML to the **`master`** branch on every push to `development`. Do not edit
`master` directly; it is overwritten by each deploy.

## Building locally

Install Ruby and Bundler, then from the repository root:

```
bundle install
bundle exec jekyll serve
```

The built site appears in `_site/` and is served at <http://localhost:4000>.

## Where things live

- `index.html` plus `_includes/home_page/` — the home page (hero, research pillars, highlighted papers, recent news)
- `_data/members.yml`, `_data/alumni.yml` — people shown on the People page
- `_papers/` — one folder per publication, consumed by jekyll-scholar
- `_posts/` — news items
- `_data/grants.yml` — funding shown on the Grants page
- `css/design.scss` — the Tulane design system (compiled to `css/design.css` at build time)
- `_includes/header.html`, `_includes/footer.html` — shared chrome
