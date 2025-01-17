# PROJECT-REV-MEMORY.md

This document outlines the steps and format used to create the memory structure for the Pipelines-Cali project. It also provides instructions for future AI agents to follow a similar process.

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

## Instructions for Future AI Agents

When creating a similar memory structure, follow these steps:

1.  **Identify the Main Project:** Create a main memory node representing the entire project. This node should have a clear name, type (e.g., Project), and a high-level description.
2.  **Identify Sub-Memories:** Break down the project into logical sub-memories (e.g., Documentation, AppStructure, etc.). Each sub-memory should have a clear name, type, and description.
3.  **Add Observations:** Add detailed observations to each memory node. These observations should capture the key information about the project, its components, and their relationships.
4.  **Establish Relations:** Create relations between the main memory node and its sub-memories to establish a clear hierarchy.
5.  **Use MCP Server and Tools:**
    -   Use the `memory` MCP server to create entities and relations.
    -   Use the `filesystem` MCP server to list directories and read file contents.
    -   Use the `list_files` tool to get a recursive listing of files and directories.
    -   Use the `read_multiple_files` tool to read the content of multiple files.
6.  **JSON Formatting:**
    -   **Error:** I encountered errors when trying to add large amounts of content to the memory using the `add_observations` tool. The tool failed with "Invalid JSON argument" errors.
    -   **Solution:** I had to break down the content into smaller chunks and add them as separate observations. I also had to ensure that the JSON was properly formatted with closing brackets.
    -   **Recommendation:** When using the `add_observations` tool, be mindful of the size of the content and break it down into smaller chunks if necessary. Ensure that the JSON is properly formatted.
7.  **File Content Handling:**
    -   **Error:** I initially had trouble adding file contents with newlines and backslashes.
    -   **Solution:** I had to add the file content as a single string, without any escaping.
    -   **Recommendation:** When adding file contents, add them as a single string without any escaping.

By following these steps, future AI agents can create a comprehensive and well-organized memory structure for any project.