# Usage

Copy or symlink `aws_utils.fish` to `~/.config/fish/functions/`

## codeartifact-login

config.fish:
```
set -x CA_PROFILE acme
set -x CA_DOMAIN acme
set -x CA_OWNER 12345678910
set -x CA_REGION us-east-1
set -x CA_REPOSITORY acmerepo
```

```shell
codeartifact-login
```

if you use awsume
```
awsume <PROFILE>
codeartifact-login
```

Function will set the following environment variables:
  - `CODEARTIFACT_AUTH_TOKEN`
  - `POETRY_HTTP`

## ecr-login
```shell
ecr-login -p someprofile -u 12345678910.dkr.ecr.us-east-1.amazonaws.com
```