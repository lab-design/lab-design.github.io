# `design.cs.iastate.edu`

This is the source code for the website for the Laboratory for Software Design
at Iowa State University. This site is hosted at <http://design.cs.iastate.edu>.


## Setup Build Environment

The site is built using [Jekyll](https://jekyllrb.com/), a static site
generator written in Ruby. Jekyll builds HTML+CSS sites from HTML, Markdown,
CSS, and SCSS augmented by [the Liquid template
language](https://shopify.github.io/liquid/).

To build the site, you will need the `jekyll` command. These instructions
suggest that you use Bundler, the standard Ruby dependency manager, to obtain
and invoke `jekyll`. Bundler can be obtained by running `gem install bundler`.
Then, an appropriate version of Jekyll (and any other ruby-based build
dependencies) can be installed with `bundle install`.

(For more background on Bundler, see [their website](https://bundler.io),
particularly [the rationale page](https://bundler.io/rationale.html).)


## Building the Site

We should now be able to use the following command to invoke our
bundler-managed version of Jekyll. Build the site by running the following
command from the root of the repository:

```
$ bundle exec jekyll build
```

The output of this build should appear in the `_site/` directory.

For iterative development, we can use Jekyll's `serve` subcommand to perform
incremental compilation as we make changes and to host the resulting site on
`localhost`:

```
$ bundle exec jekyll serve
```


## Manually Deploying the Site

Currently, the site is deployed by pushing the built website to the `pyrite`
server. This can be done by invoking the `_scripts/deploy/manually.sh` script
from the root of this repository.

Note that one can only access `pyrite` if one is either on campus or using the
ISU VPN. Additionally, one will only be able to push to the deployment folder
on `pyrite` if one has appropriate UNIX permissions on that machine. Ask Dr.
Rajan if you need to be given such permissions. At the moment, he would likely
forward you to Dean, who will likely add you to the `coms-design` UNIX group.

In the future, we may use a continuous deployment solution, but that is not yet
implemented.
