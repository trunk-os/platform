Packaging repository

## Make Tasks

### Top level

- `all`: builds all subtrees
- `clean`: cleans all subtree build artifacts
- `run-containers`: runs all containers; see "Containers" below for more information.

### Containers

**NOTE:** to get this functionality, a new dir must have a `Makefile` with `include ../include.mk` in it.

- `all`: builds subdirs with `podman build`, tags them with the date and `:latest`. They will be in the `localhost` repository by default. Set the follow variables to influence a build:
    - `REPOSITORY`: the repository (first part) of the image name; set to `localhost` by default.
    - `NAME`: the name of the directory by default. Changing this will change the tags and the name of the container run by default. Take care when adjusting this.
    - `BASE_TAG`: `$(REPOSITORY)/$(NAME)`, quite literally.
    - `TAG`: the literal tag to use, combining `BASE_TAG` and a `YYYY-MM-DD` date.
    - `LATEST_TAG` is also tagged with the above schema just with `:latest` instead of the date.
    - `BUILD_ARGS` is defaulted to `--pull=always --no-cache` to keep packages compiling fresh, you can disable this by setting it to an empty string for faster builds (nice for files you edit).
- `clean`: cleans up files created to track the build. Useful if you delete your images.

#### Making a container makefile

- `include ../include.mk` on the first line
- optionally overwrite `run`; it controls container startup with podman.
- also optionally overwrite `pre-down`, which is run right before the container is removed forcefully.
- Make use of `$(TAG)` and `$(NAME)` to keep with the common workflow within these tasks.
- everything else should be managed for you. There are other tasks in [containers/include.mk](include.mk) you can overwrite, but it probably isn't wise.
