terraform {
  cloud {

    organization = "igb"

    workspaces {
      name = "ws-blog-prod"
    }
  }
}
