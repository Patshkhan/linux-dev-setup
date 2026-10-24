# Linux Dev Setup

A small, inspectable starting point for a Linux development environment. Created for my Arch Linux workflow; the diagnostic script also works on other systems with Bash. It does not install packages or modify shell configuration.

## Start with an inventory

```sh
bash scripts/check-tools.sh
```

The script only checks whether common development commands are available. It does not read environment files, tokens, Git configuration, logs, or Docker credentials. Missing optional tools are reported as `missing`; that is not a failed installation check.

## Set up deliberately

1. Read the project's runtime and package-manager requirements. Keep Node.js and package-manager versions consistent with its manifest and lockfile.
2. On Arch, review [maintenance guidance](https://wiki.archlinux.org/title/System_maintenance) before installing system packages. A full upgrade with selected tools is `sudo pacman -Syu git github-cli base-devel python nodejs npm`; it changes the system and should be scheduled accordingly.
3. Authenticate interactively with `gh auth login`. Verify with `gh api user --jq .login`; select the intended account before accessing a repository.
4. Set commit identity per project with `git config --local user.name YOUR_NAME` and `git config --local user.email YOUR_GITHUB_NOREPLY_EMAIL`. Replace both placeholders. Authentication does not set commit authorship.
5. Keep credentials outside source control. Start from an audited `.env.example` when supplied. A `.gitignore` does not remove anything already committed.
6. Run the project's documented tests before changing it. Use a separate local database and synthetic records for experiments.

For Python projects, use `python -m venv .venv` and `source .venv/bin/activate`; exclude `.venv/` from Git. For npm projects with a lockfile, use `npm ci`. Use the repository's chosen package manager instead of creating a second lockfile.

## Docker boundary

Install and configure Docker using [the official instructions](https://docs.docker.com/engine/install/). Docker daemon access grants substantial control over the host. This repository does not add a user to the Docker group or enable system services automatically. Check `docker context show` before running a local lab.

See [Docker Lab](https://github.com/Patshkhan/docker-lab) for an isolated learning exercise and [Arch Linux Notes](https://github.com/Patshkhan/arch-linux-notes) for diagnostics.

## Next steps

- [ ] Add optional language-specific setup guides after testing them.
- [ ] Document a fresh-machine setup with measured outcomes.
- [ ] Add a development-container example with no host secrets mounted.

**По-русски:** стартовая памятка по Linux-окружению разработчика и безопасный скрипт проверки наличия инструментов. Автоматической перенастройки компьютера нет.
