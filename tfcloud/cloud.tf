terraform {
  cloud {
    organization = "larvin"

    workspaces {
      name = "my_example"
    }
  }
}
