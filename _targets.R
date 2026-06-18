library(targets)

lapply(list.files("R", pattern = "\\.R$", full.names = TRUE), source)

tar_option_set(
  packages = c() # add packages your targets need
)

list(
  tar_target(example_data, make_example_data()),
  tar_target(example_summary, summarise_example(example_data))
)
