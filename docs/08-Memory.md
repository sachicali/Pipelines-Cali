# Memory Documentation

This document explains the memory structure used in this project and the purpose of the `PROJECT-REV-MEMORY.md` file.

## Memory Structure

The memory structure is designed to capture the project's organization and details in a hierarchical manner.

### Main Memory

-   **Name:** Pipelines-Cali
-   **Type:** Project
-   **Description:** This is the main memory node representing the entire project. It encapsulates all sub-memories and provides a high-level overview of the project.
-   **Observations:**
    -   YouTube analytics system project
    -   Ruby-based application with Rails integration
    -   Includes comprehensive documentation
    -   Maintains changelog following Keep a Changelog conventions
    -   Features API, GUI, Workers, Services, Models, Configuration, and Testing components

### Sub-Memories

-   **Documentation:**
    -   **Type:** Knowledge
    -   **Description:** Contains information about the project's documentation.
    -   **Observations:**
        -   Created comprehensive documentation for the codebase
        -   Documentation includes API, GUI, Workers, Services, Models, Configuration, and Testing
        -   Files stored in docs/ directory with markdown format
-   **AppStructure:**
    -   **Type:** DirectoryStructure
    -   **Description:** Represents the directory structure of the `app/` folder, including all subfolders and files.
    -   **Observations:**
        -   assets/ - Contains static assets including stylesheets and images
        -   channels/ - Action Cable channels
        -   controllers/ - Application controllers including API controllers
        -   helpers/ - View helpers
        -   javascript/ - JavaScript assets including Stimulus controllers
        -   jobs/ - Background jobs
        -   mailers/ - Email templates and mailers
        -   models/ - Application models and concerns
        -   services/ - Service layer components
        -   views/ - View templates including layouts and partials
        -   (And all file contents, added one by one)
-   **CHANGELOG.md:**
    -   **Type:** File
    -   **Description:** Represents the changelog file.
-   **README.md:**
    -   **Type:** File
    -   **Description:** Represents the README file.

## PROJECT-REV-MEMORY.md

The `PROJECT-REV-MEMORY.md` file is a document that outlines the steps and format used to create the memory structure for the Pipelines-Cali project. It also provides instructions for future AI agents to follow a similar process. This file serves as a guide for understanding how the memory is organized and how to maintain it.

## Memory Maintenance

The memory structure is maintained using the `memory` MCP server and its tools. The `add_observations` tool is used to add new information to existing memory nodes. The `create_entities` and `create_relations` tools are used to create new memory nodes and establish relationships between them.

This documentation should help future AI agents understand the memory structure and how to maintain it.