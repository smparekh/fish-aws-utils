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
Logging in <SSO_URL>
# you can pass in -n to skip sso login and just awsume profile
Login succeeded, valid until 2024-10-02 17:58 EDT
[<someprofile>] Role credentials will expire 2024-10-02 15:56:21
Login Succeeded
```
