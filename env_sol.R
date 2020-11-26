library(pryr)
library(checkmate)
library(testthat)


anywhere <- function(name, env = parent.frame()) {
  checkmate::assert_string(name)
  env <- pryr:::to_env(env)
  env_list <- list()
  
  while (!identical(env, emptyenv())) {
    if (exists(name, env, inherits = FALSE)) {
      env_list <- append(env_list, env)
    }
    env <- parent.env(env)
  }
  env_list
}

testthat::test_file("test-env-anywhere.R")
