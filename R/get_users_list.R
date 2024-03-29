#' get_users_list fetch all users
#'
#' @param token login token generated by \code{\link{get_login_token}}
#'
#' @return data.frame
#' @export
#'
get_users_list <- function(token) {
  get_generic_list(token, 0, "/api/users/v2",
                   c('type', 'id', 'addedAt', 'role', 'email', 'organization',
                     'language'),
                   c('addedAt'))
}


