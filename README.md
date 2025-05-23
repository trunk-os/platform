Packaging repository

## Make Tasks

### Top level

- `all`: builds all subtrees
- `clean`: cleans all subtree build artifacts

### Containers

**NOTE:** to get this functionality, a new dir must have a `Makefile` with `include ../include.mk` in it.

- `all`: builds subdirs with `podman build`, tags them with the date and `:latest`. They will be in the `localhost` repository by default. Set the follow variables to influence a build:
    - `REPOSITORY`: the repository (first part) of the image name; set to `localhost` by default.
    - `BASE_TAG`: should **not be adjusted**, it is the name of the dir with the repository prepended.
    - `TAG`: the literal tag to use, combining `BASE_TAG` and a `YYYY-MM-DD` date.
    - `LATEST_TAG` is also tagged with the above schema just with `:latest` instead of the date.
- `clean`: cleans up files created to track the build. Useful if you delete your images.
