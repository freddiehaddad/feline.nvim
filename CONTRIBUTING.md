# Contribution guidelines

First, thank you for wanting to contribute to Feline!

The following is a set of guidelines for anyone wishing to contribute. Remember,
these are not strict rules that must be followed, but rather guidelines meant to
help get you started. Certain scenarios may not be covered here. If you find
yourself in that case, please ask in the discussions.

This file is far from perfect, so feel free to create a Pull Request if you want
to propose changes to it or make an Issue if you want to ask for further
clarification on it.

## Ways to contribute

There are a few ways to contribute to Feline, and every contribution is equally
welcome. So don't hesitate or think that your contribution is too small -- every
contribution counts! Here are some of the following ways you can contribute to
Feline:

### Bug reports

Facing an annoying bug that you want fixed?
[Open a Bug Report](https://github.com/freddiehaddad/feline.nvim/issues/new/choose).

When you open a bug report, please make sure to provide all the information that
the Issue template asks for since lack of information can make it hard for us to
fix the problems that you're facing. Describe your problems clearly and
concisely. Avoid putting unnecessary or irrelevant information and also avoid
omitting necessary or relevant information. Also, make sure that the issue
you're reporting hasn't already been reported before.

### Feature requests

Want to request a new feature that you think is necessary?
[Open a Feature Request](https://github.com/freddiehaddad/feline.nvim/issues/new/choose).

Please avoid asking for features that aren't necessary or features that go
against Feline's design goals of minimalism and leaving most things to the user.
Also clarify why exactly you want that feature and how it can be useful, and why
you think it needs to be implemented in Feline. Lastly, please ensure the
feature request hasn't already been discussed or is currently in discussion.

### Documentation improvement

Notice a typo or grammatical error in the documentation? Find some of the
documentation too vague and want further clarification?
[Ask for a Documentation Improvement](https://github.com/freddiehaddad/feline.nvim/issues/new/choose).

### Pull Requests

If you wish to directly contribute to Feline, creating a Pull Request is the way
to it. Note that the Pull Request doesn't necessarily have to be about fixing
bugs in the code or adding new features. You can make a Pull Request for even
minor things like fixing typos, correcting grammatical mistakes, improving
existing documentation or adding new documentation.

#### Guidelines for making a Pull Request

Before making a Pull Request, be sure to:

- Properly test your changes.
- Avoid "breaking changes" (changes that break backwards compatibility) without
  a good reason.
- Add relevant details in the description of your Pull Request, such as what
  issue(s) it's linked to, what problems it fixes and how it fixes them, what
  features it adds, etc.
- Use [semantic commit messages](https://www.conventionalcommits.org/) for your
  commits.

### Standards and Style Guides

Feline uses [StyLua](https://github.com/JohnnyMorganz/StyLua) to format the Lua
files and prettier for formatting Markdown files. Please verify that files you
modify are formatted using the rules defined in `stylua.toml` and
`.prettierrc.yml`. For commits, always use
[semantic commit messages](https://www.conventionalcommits.org/).
