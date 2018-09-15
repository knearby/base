# Knearby Base
Documentation and system provisioning for Knearby.

# System Overview
![Knearby System Overview](./out/system/Knearby%20System%20Overview.png)

# Setting Up Knearby for Development
## Provision Central Services
Clone this repository and run the following from the root:

```sh
# for docker-compose:
make init.docker;

# for minikube:
make init.minikube;
```

# Setting Up This Repo
## PlantUML Plugin
Search for [PlantUML by jebbs](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml) in the Visual Studio Code extension marketplace and install it. On any `.puml` file, hit Ctrl/Cmd + P and enter ">PlantUML" and you should be able to preview the PlantUML diagram in a side-by-side pane.

# Other Links
- [Source Code on GitHub](https://github.com/knearby)
- [Images on DockerHub](https://hub.docker.com/u/knearby/)

