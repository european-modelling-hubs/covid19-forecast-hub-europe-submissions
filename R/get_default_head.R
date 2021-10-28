#' Get default HEAD
#' 
#' Get last commit from a GitHub default branch
#' 
#' @param gh_user Name of GitHub user/org where the repo is hosted
#' @param gh_repo Name of GitHub repo
#' 
#' @examples
#' get_default_head("epiforecasts", "covid19-forecast-hub-europe")
#' 
#' @importFrom glue glue
#' @importFrom gh gh_gql
#' 
#' @export

get_default_head <- function(gh_user, gh_repo) {
  
  q <- glue('
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
  
  a <- gh_gql(q)
  
  return(a$data$repository$defaultBranchRef$target$history$nodes[[1]]$oid)
  
}
