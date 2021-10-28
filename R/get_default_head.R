get_default_head <- function(gh_user, gh_repo) {
  
  q <- glue::glue('
  {
    repository(name: "<<gh_repo>>", owner: "<<gh_user>>") {
      defaultBranchRef {
        target {
          ... on Commit {
            history(first: 1) {
              nodes {
                oid
              }
            }
          }
        }
      }
    }
  }', gh_repo = gh_repo, gh_user = gh_user, .open = "<<", .close = ">>"
  )
  
  a <- gh::gh_gql(q)
  
  return(a$data$repository$defaultBranchRef$target$history$nodes[[1]]$oid)
  
}
