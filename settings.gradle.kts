plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.8.0"
}


rootProject.name = "Food_Web"


include("FirstTask")
include("FirstTask:src:test:Application")
findProject(":FirstTask:src:test:Application")?.name = "Application"