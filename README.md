# scaphandre-node-ci

A Docker image that contains [Scaphandre](https://github.com/hubblo-org/scaphandre) and NodeJS 16.

💡It is intended to be used in CI scripts, to help measure power consumption of a test run.

## Content

The Docker image is build by github action and published at <https://hub.docker.com/repository/docker/odemeringo/scaphandre-node-ci>

```sh
docker run -it odemeringo/scaphandre-node-ci:latest
```

The Docker image is based on `node:lts-bullseye`, in addition to nodejs and scaphandre, it contains:

- `jq` and `curl` to ease exporting results
- `stress-ng` that can be used to generate artificial load on the system (to test the measure for example)

## Usage in CI

You can see this container used in GitlabCI in this repository: [olivier de Meringo / scaphandre-runner](https://gitlab.com/demeringo/scaphandre-runner).

## Thanks

🌳 _All credits go to the great Scaphandre project_: <https://github.com/hubblo-org/scaphandre>
