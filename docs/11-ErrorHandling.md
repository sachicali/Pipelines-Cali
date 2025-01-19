# Error Handling Documentation

This document describes the error handling mechanisms implemented in the Pipeline system.

## Overview

The system uses a combination of try-catch blocks, `rescue_from` blocks, and custom error classes to handle errors gracefully. This approach ensures that errors are logged with detailed information, and users are provided with appropriate feedback.

## Error Handling Mechanisms

### 1. Error Handler Module

The `ErrorHandler` module is included in controllers to rescue from `StandardError`. It logs detailed error information, including the class name, message, and backtrace, using `Rails.logger.error`. This module also renders a JSON response with the error message and an internal server error status (`500`).

### 2. Pipeline::Error and Subclasses

The `Pipeline::Error` class (defined in `lib/pipeline/errors.rb`) serves as the base class for all application-specific errors. Subclasses include:
- `APIError`: For errors related to external API calls.
- `ValidationError`: For errors related to data validation.
- `AnalysisError`: For errors during the analysis process.
- `StorageError`: For errors related to data storage or retrieval.
- `ConfigurationError`: For errors related to system configuration.

These custom error classes are used to provide more specific error handling and logging.

### 3. Background Job Error Handling

Background jobs, such as `ChannelAnalysisJob`, use `rescue_from` blocks to handle `Pipeline::Error` and `StandardError`. When a `Pipeline::Error` occurs, the job logs the error (including the backtrace) using `Rails.logger.error` and notifies the user via Turbo Streams, rendering a `dashboard/error` partial. When a `StandardError` occurs, the job logs the error (including the backtrace) using `Rails.logger.error`.

### 4. Controller Error Handling

Controllers use `rescue_from` blocks to handle `Pipeline::Error` and `StandardError`. When a `Pipeline::Error` occurs, the controller logs the error (including the backtrace) using `Rails.logger.error`, displays a flash message to the user, and redirects to the root path. When a `StandardError` occurs, the controller logs the error (including the backtrace) using `Rails.logger.error`, displays a generic flash message, and redirects to the root path.

### 5. Service Layer Error Handling

The service layer uses try-catch blocks to handle potential errors, such as API call failures or Redis cache errors. When an error occurs, the service layer logs the error using `Rails.logger.error` and raises a `Pipeline::Error` or one of its subclasses.

### 6. Rails Cache Error Handling

The system uses try-catch blocks to handle potential errors when reading from or writing to the Rails cache. When an error occurs, the system logs the error using `Rails.logger.error` and returns `nil` or raises a `Pipeline::StorageError`.

### 7. JavaScript Error Handling

The system uses try-catch blocks to handle potential errors in JavaScript components. When an error occurs, the system logs the error using `console.error`.

## Logging

All errors are logged using `Rails.logger.error` or `console.error`, which includes the error message and backtrace when available.

## User Feedback

User feedback is provided through:
- Turbo Streams for background job errors, displaying a `dashboard/error` partial.
- Flash messages for controller errors, displayed on the redirected page.
- JSON responses for API errors, returning a JSON object with an error message and an appropriate status code.

This documentation provides a comprehensive overview of the error handling mechanisms implemented in the Pipeline system.