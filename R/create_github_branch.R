create_github_branch <- function(new_branch, sha, gh_user, gh_repo) {
  
  if (missing(sha)) {
    message("Branching from the HEAD of the default branch")
    sha <- get_default_head(gh_user, gh_repo)
  }
  
  gh::gh(
    "POST https://api.github.com/repos/{gh_user}/{gh_repo}/git/refs",
    gh_user = gh_user,
    gh_repo = gh_repo,
    ref = glue::glue("refs/heads/{new_branch}"),
    sha = sha
  )
   
}