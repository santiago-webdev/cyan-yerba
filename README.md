# Cyan Yerba

This repo serves as a place to store shell scripts and `Containerfile`s that
help me setup my container workflow, which I need the most when running distros
like [OpenSUSE MicroOS](https://microos.opensuse.org/) or [Fedora Kinoite](https://kinoite.fedoraproject.org/download/).

## Before running any script

For Fedora Silverblue/Kinoite you should update before running any script:

```bash
rpm-ostree upgrade
```

For OpenSUSE MicroOS you _shouldn't_ but could update by running:

```bash
sudo transactional-update
```
