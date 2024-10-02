function codeartifact-login -d "Logs into CodeArtifact and sets up some default env variables"
    set REPO_UPPER (string upper $CA_REPOSITORY)
    set -Ux CODEARTIFACT_AUTH_TOKEN (aws codeartifact get-authorization-token --profile $CA_PROFILE --region $CA_REGION --domain $CA_DOMAIN --domain-owner $CA_OWNER --query authorizationToken --output text)
    set -Ux POETRY_HTTP_BASIC_{$REPO_UPPER}_USERNAME aws
    set -Ux POETRY_HTTP_BASIC_{$REPO_UPPER}_PASSWORD $CODEARTIFACT_AUTH_TOKEN
end

function ecr-login -d "Logs into Elastic Container Registry, needs aws-sso-util, awsume and docker"
    argparse h/help p/profile u/url r/region n/nosso -- $argv
    or return
    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        echo "ecr-login [-h|--help] [-p|--profile] [-u|--url] [-r|--region] [-n|--nosso]"
        return 0
    end
    if set -ql _flag_nosso
        echo "Not using sso"
    else
        aws-sso-util login --profile $argv[1]
    end
    awsume $argv[1]
    if set -ql _flag_region
        aws ecr get-login-password --region $argv[3] | docker login --username AWS --password-stdin $argv[2] 
    else
        aws ecr get-login-password | docker login --username AWS --password-stdin $argv[2]
    end
end
