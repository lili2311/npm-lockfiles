workflow "Test for vulnerabilities and publish to NPM" {
  on = "push"
  resolves = ["GitHub Action for npm"]
}

action "Snyk" {
  uses = "./.action-a"
  secrets = ["GITHUB_TOKEN"]
  env = {
    SNYK_TOKEN = "925d8d69-7916-4aa1-a074-8deb2b2d9d84"
  }
}

action "GitHub Action for npm" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  needs = ["Snyk"]
}

workflow "New workflow" {
  on = "push"
  resolves = ["Snyk CLI"]
}

action "Snyk CLI" {
  uses = "https://github.com/lili2311/snyk-cli-action"
  secrets = ["SNYK_TOKEN"]
}
