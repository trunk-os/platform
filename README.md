Packaging repository

## Make Tasks

### Top level

- `all`: builds all subtrees
- `clean`: cleans all subtree build artifacts
- `run-containers`: runs all service containers
- `recreate-trunk` and `import-trunk`: create a zpool named `/trunk` out of sparse files (so they only take storage when necessary), or reimport and existing zpool, such as after a reboot.

### Containers

**NOTE:** to get this functionality, a new dir must have a `Makefile` with `include ../include.mk` in it.

Note that these tasks work at a macro level as you work back towards the root of the `containers` tree: `all` will run `build` for anywhere from a single container image to the whole tree of them. The exception is `run`, which only runs the `services/` directory as the rest are building blocks.

- `all`: builds subdirs with `podman build`, tags them with the date and `:latest`. They will be in the `localhost` repository by default. Set the follow variables to influence a build:
    - `REPOSITORY`: the repository (first part) of the image name; set to `localhost` by default.
    - `NAME`: the name of the directory by default. Changing this will change the tags and the name of the container run by default. Take care when adjusting this.
    - `BASE_TAG`: `$(REPOSITORY)/$(NAME)`, quite literally.
    - `TAG`: the literal tag to use, combining `BASE_TAG` and a `YYYY-MM-DD` date.
    - `LATEST_TAG` is also tagged with the above schema just with `:latest` instead of the date.
    - `BUILD_ARGS` is defaulted to `--pull=always --no-cache` to keep packages compiling fresh, you can disable this by setting it to an empty string for faster builds (nice for files you edit).
- `build`: build all container images, in dependency order.
- `push`: push images.
- `run`: run all `services/` images.
- `clean`: cleans up files created to track the build. Useful if you delete your images.

#### Making a container Makefile

- Find a place to put it: `base` is for building blocks, `services` is for services we will install as part of the installation/upgrade process.
- `include ../include.mk` on the first line
- optionally overwrite `run`; it controls container startup with podman.
- also optionally overwrite `pre-down`, which is run right before the container is removed forcefully.
- Make use of `$(TAG)` and `$(NAME)` to keep with the common workflow within these tasks.
- everything else should be managed for you. There are other tasks in [include.mk](containers/include.mk) you can overwrite, but it probably isn't wise.
