#' Create GitHub branch
#' 
#' @param new_branch name of the branch to create
#' @param sha SHA from which to create the branch. If left empty, the latest 
#' commit from the default branch will be used
#' @inheritParams get_default_head
#' 
#' @importFrom gh gh
#' @importFrom glue glue
#' 
#' @export
#' 
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