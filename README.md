# Custom Salus Example

This repo is an example of how to build a [Salus container](https://github.com/coinbase/salus) that includes custom scanners not in the official version. This might be useful for internal use within your organization.

This version of Salus includes a scanner for checking that Dockerfiles use a pinned base container.

## Build the custom image

```
docker build -t salus-custom .
```

## Run the custom image

```
docker run --rm -t -v $(pwd):/home/repo salus-custom
```

Since the Dockerfile used in this repo is not pinned, the scan fails.

```
#################### Salus Scan v1.0.0 for Project ####################

	PatternSearch => passed

	PinnedBaseContainer => failed

	RepoNotEmpty => passed

	overall => passed
```
