# Docker Image for deployment

This image based at Ubuntu and contains:
* ssh-client
* rsync

## Usage

```Bash
$ docker pull kudlayry/deploy-tools
```

## Example of .gitlab-ci.yml

```YAML
image: kudlayry/deploy-tools:latest

stages:
  - deploy


deploy:
  stage: deploy
  only:
    - master
  environment:
    name: Dev
  script:
    - eval $(ssh-agent -s)
    - echo "$DEPLOY_DEV_KEY" | tr -d '\r' | ssh-add - > /dev/null
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts
    - chmod 644 ~/.ssh/known_hosts
    - ssh $USER@$HOST uname -a
    - rsync -a public $USER@$HOST:/var/www/public
```
