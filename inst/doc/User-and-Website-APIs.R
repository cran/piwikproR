## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  library(piwikproR)
#  # Piwik credentials
#  piwik_pro_credentials <- list(
#    client_id = "my_client_id",
#    client_secret = "my_client_secret",
#    url = "https://my_site.piwik.pro"
#   )
#  # Fetch a Piwik token
#  token <- get_login_token(piwik_pro_credentials)

## ---- eval = FALSE------------------------------------------------------------
#  apps <- get_apps_list(token)

## ---- echo = FALSE------------------------------------------------------------
apps <- tibble::tribble(
  ~type, ~id, ~name, ~addedAt, ~updatedAt,
  "ppms/meta-site", "some-hex-id-number-1", "site-name-1.com", lubridate::ymd_hms("2022-01-02 08:10:20"), lubridate::ymd_hms("2022-01-04 10:08:10"),
  "ppms/meta-site", "some-hex-id-number-2", "site-name-2.org", lubridate::ymd_hms("2022-02-02 08:10:20"), lubridate::ymd_hms("2022-02-04 10:08:10"),
  "ppms/meta-site", "some-hex-id-number-3", "site-name-3.net", lubridate::ymd_hms("2022-03-02 08:10:20"), lubridate::ymd_hms("2022-03-04 10:08:10")
)

## -----------------------------------------------------------------------------
apps

## ---- eval = FALSE------------------------------------------------------------
#  metasites <- get_metasites_list(token)

## ---- echo = FALSE------------------------------------------------------------
metasites <- tibble::tribble(
  ~type, ~id, ~name, ~created_at, ~updated_at,
  "ppms/apps", "some-hex-id-meta-1", "Meta site 1", lubridate::ymd_hms("2022-01-02 08:10:20"), lubridate::ymd_hms("2022-01-04 10:08:10"),
  "ppms/apps", "some-hex-id-meta-2", "Meta site 2", lubridate::ymd_hms("2022-02-02 08:10:20"), lubridate::ymd_hms("2022-02-04 10:08:10"),
  "ppms/apps", "some-hex-id-meta-3", "Meta site 3", lubridate::ymd_hms("2022-03-02 08:10:20"), lubridate::ymd_hms("2022-03-04 10:08:10")
)

## -----------------------------------------------------------------------------
metasites

## ---- eval = FALSE------------------------------------------------------------
#  permissions_per_site <- function(app) {
#    get_permissions_for_app(token, app) %>%
#      mutate(site = app)
#  }

## ---- echo = FALSE------------------------------------------------------------
permissions <- tibble::tribble(
  ~type, ~id, ~email, ~permission, ~group_permissions, ~overall_permissions, ~site,
  'app/permission/user', 'some-hex-id-1', 'email@user-1.com', 'no-access', 'edit-publish', 'edit-publish', 'some_app_id',
  'app/permission/user', 'some-hex-id-2', 'email@user-2.com', 'manage', 'no-access', 'manage', 'some_app_id'
)

## ---- eval = FALSE------------------------------------------------------------
#  permissions <- permissions_per_site('some_app_id')

## -----------------------------------------------------------------------------
permissions

## ---- eval = FALSE------------------------------------------------------------
#  complete_permissions <- apps %>%
#    pull(id) %>%
#    map_dfr(permissions_per_site) %>%
#    left_join(apps, by = c("site" = "id")) %>%
#    filter(overall_permissions != "no-access")

