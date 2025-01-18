## Start Here

[Getting Started with Rails](getting_started.html)

Everything you need to know to install Rails and create your first application.

 [Install Ruby on Rails](install_ruby_on_rails.html)

Learn how to install the Ruby programming language and Ruby on Rails.

 
## Models

[Active Record Basics](active_record_basics.html)

Active Record allows your models to interact with the application's database. This guide will get you started with Active Record models and persistence to the database.

 [Active Record Migrations](active_record_migrations.html)

Migrations are a feature of Active Record that allows you to evolve your database schema over time. Rather than write schema modifications in pure SQL, migrations allow you to use a Ruby DSL to describe changes to your tables.

 [Active Record Validations](active_record_validations.html)

Validations are used to ensure that only valid data is saved into your database. This guide teaches you how to validate the state of objects before they go into the database, using Active Record's validations feature.

 [Active Record Callbacks](active_record_callbacks.html)

Callbacks make it possible to write code that will run whenever an object is created, updated, destroyed, etc. This guide teaches you how to hook into this object life cycle of Active Record objects.

 [Active Record Associations](association_basics.html)

In Active Record, an association is a connection between two Active Record models. This guide covers all the associations provided by Active Record.

 [Active Record Query Interface](active_record_querying.html)

Instead of using raw SQL to find database records, Active Record provides better ways to carry out the same operations. This guide covers different ways to retrieve data from the database using Active Record.

 [Active Model Basics](active_model_basics.html)

Active Model allows you to create plain Ruby objects that integrate with Action Pack, but don't need Active Record for database persistence. Active Model also helps build custom ORMs for use outside of the Rails framework. This guide provides you with all you need to get started using Active Model classes.

 
## Views

[Action View Overview](action_view_overview.html)

Action View is responsible for generating the HTML for web responses. This guide provides an introduction to Action View.

 [Layouts and Rendering in Rails](layouts_and_rendering.html)

This guide covers the basic layout features of Action Controller and Action View, including rendering and redirecting, using content\_for blocks, and working with partials.

 [Action View Helpers](action_view_helpers.html)

Action View has helpers for handling everything from formatting dates and linking to images, to sanitizing and localizing content. This guide introduces a few of the more common Action View helpers.

 [Action View Form Helpers](form_helpers.html)

HTML forms can quickly become tedious to write and maintain because of the need to handle form control naming and its numerous attributes. Rails does away with this complexity by providing view helpers for generating form markup.

 
## Controllers

[Action Controller Overview](action_controller_overview.html)

Action Controllers are the core of a web request in Rails. This guide covers how controllers work and how they fit into the request cycle of your application. Topics include accessing parameters in controller actions, using sessions and cookies, controller callbacks.

 [Action Controller Advanced Topics](action_controller_advanced_topics.html)

This guide covers a number of advanced topics related to controllers in a Rails application such as protecting against cross-site request forgery, HTTP authentication, data streaming, and dealing with exceptions, log filtering, and more.

 [Rails Routing from the Outside In](routing.html)

The Rails router recognizes URLs and dispatches them to a controller's action. This guide covers the user-facing features of Rails routing. If you want to understand how to use routing in your own Rails applications, start here.

 
## Other Components

[Active Support Core Extensions](active_support_core_extensions.html)

Active Support provides Ruby language extensions and utilities. It enriches the Ruby language for the development of Rails applications, and for the development of Ruby on Rails itself.

 [Action Mailer Basics](action_mailer_basics.html)

This guide provides you with all you need to get started in sending emails from your application, and many internals of Action Mailer.

 [Action Mailbox Basics](action_mailbox_basics.html)

This guide describes how to use Action Mailbox to receive emails.

 [Action Text Overview](action_text_overview.html)

This guide describes how to use Action Text to handle rich text content.

 [Active Job Basics](active_job_basics.html)

Active Job is a framework for declaring background jobs and making them run on a variety of queuing backends. This guide provides you with all you need to get started creating, enqueuing, and executing background jobs.

 [Active Storage Overview](active_storage_overview.html)

Active Storage facilitates uploading files to a cloud storage service, transforming uploads and extracting metadata. This guide covers how to attach files to your Active Record models.

 [Action Cable Overview](action_cable_overview.html)

Action Cable integrates WebSockets with the rest of your Rails application. It allows for real-time features to be written in Ruby in the same style and form as the rest of your Rails application. This guide explains how Action Cable works, and how to use WebSockets to create real-time features.

 
## Digging Deeper

[Rails Internationalization (I18n) API](i18n.html)

This guide covers how to add internationalization to your applications. Your application will be able to translate content to different languages, change pluralization rules, use correct date formats for each country, and so on.

 [Testing Rails Applications](testing.html)

This guide explores how to write tests in Rails. It also covers test configuration and compares approaches to testing an application.

 [Debugging Rails Applications](debugging_rails_applications.html)

This guide describes how to debug Rails applications. It covers the different ways of achieving this and how to understand what is happening "behind the scenes" of your code.

 [Configuring Rails Applications](configuring.html)

This guide covers the basic configuration settings for a Rails application.

 [The Rails Command Line](command_line.html)

There are a few commands that are absolutely critical to your everyday usage of Rails. This guide covers the command line tools provided by Rails.

 [The Asset Pipeline](asset_pipeline.html)

The asset pipeline guide explains how to use Propshaft, a framework that handles essential asset management tasks.

 [Working with JavaScript in Rails](working_with_javascript_in_rails.html)

This guide explains how to use import maps or jsbundling-rails to include JavaScript in Rails applications, and covers the basics of working with Turbo in Rails.

 [The Rails Initialization Process](initialization.html)Work in progress

This guide explains the internals of the initialization process in Rails. It is an extremely in-depth guide and recommended for advanced Rails developers.

 [Autoloading and Reloading](autoloading_and_reloading_constants.html)

This guide documents how autoloading and reloading constants work.

 [Active Support Instrumentation](active_support_instrumentation.html)Work in progress

This guide explains how to use the instrumentation API inside of Active Support to measure events inside of Rails and other Ruby code.

 [Using Rails for API-only Applications](api_app.html)

This guide explains how to effectively use Rails to develop a JSON API application.

 
## Going to Production

[Tuning Performance for Deployment](tuning_performance_for_deployment.html)

This guide covers performance and concurrency configuration for deploying your production Ruby on Rails application.

 [Caching with Rails: An Overview](caching_with_rails.html)

This guide is an introduction to speeding up your Rails application with caching.

 [Securing Rails Applications](security.html)

This guide describes common security problems in web applications and how to avoid them with Rails.

 [Error Reporting in Rails Applications](error_reporting.html)

This guide introduces ways to manage errors that occur in Ruby on Rails applications.

 
## Advanced Active Record

[Active Record and PostgreSQL](active_record_postgresql.html)Work in progress

This guide covers PostgreSQL specific usage of Active Record.

 [Multiple Databases](active_record_multiple_databases.html)

This guide covers using multiple databases in your application.

 [Active Record Encryption](active_record_encryption.html)Work in progress

This guide covers encrypting your database information using Active Record.

 [Composite Primary Keys](active_record_composite_primary_keys.html)

This guide is an introduction to composite primary keys for database tables.

 
## Extending Rails

[The Basics of Creating Rails Plugins](plugins.html)Work in progress

This guide covers how to build a plugin to extend the functionality of Rails.

 [Rails on Rack](rails_on_rack.html)

This guide covers Rails integration with Rack and interfacing with other Rack components.

 [Creating and Customizing Rails Generators & Templates](generators.html)

This guide covers the process of adding a brand new generator to your extension or providing an alternative to an element of a built-in Rails generator (such as providing alternative test stubs for the scaffold generator).

 [Getting Started with Engines](engines.html)Work in progress

Engines can be considered miniature applications that provide additional functionality to their host applications. In this guide you will learn how to create your own engine and integrate it with a host application.

 [Rails Application Templates](rails_application_templates.html)Work in progress

Application templates are simple Ruby files containing DSL for adding gems, initializers, etc. to your freshly created Rails project or an existing Rails project.

 [Threading and Code Execution in Rails](threading_and_code_execution.html)Work in progress

This guide describes the considerations needed and tools available when working directly with concurrency in a Rails application.

 
## Contributing

[Contributing to Ruby on Rails](contributing_to_ruby_on_rails.html)

Rails is not "someone else's framework". This guide covers a variety of ways that you can get involved in the ongoing development of Rails.

 [API Documentation Guidelines](api_documentation_guidelines.html)

This guide documents the Ruby on Rails API documentation guidelines.

 [Guides Guidelines](ruby_on_rails_guides_guidelines.html)

This guide documents the Ruby on Rails guides guidelines.

 [Installing Rails Core Development Dependencies](development_dependencies_install.html)

This guide covers how to set up an environment for Ruby on Rails core development.

 
## Policies

[Maintenance Policy](maintenance_policy.html)

What versions of Ruby on Rails are currently supported, and when to expect new versions.

 
## Release Notes

[Upgrading Ruby on Rails](upgrading_ruby_on_rails.html)

This guide provides steps to be followed when you upgrade your applications to a newer version of Ruby on Rails.

 [Version 8.0 - November 2024](8_0_release_notes.html)

Release notes for Rails 8.0.

 [Version 7.2 - August 2024](7_2_release_notes.html)

Release notes for Rails 7.2.

 [Version 7.1 - October 2023](7_1_release_notes.html)

Release notes for Rails 7.1.

 [Version 7.0 - December 2021](7_0_release_notes.html)

Release notes for Rails 7.0.

 [Version 6.1 - December 2020](6_1_release_notes.html)

Release notes for Rails 6.1.

 [Version 6.0 - August 2019](6_0_release_notes.html)

Release notes for Rails 6.0.

 [Version 5.2 - April 2018](5_2_release_notes.html)

Release notes for Rails 5.2.

 [Version 5.1 - April 2017](5_1_release_notes.html)

Release notes for Rails 5.1.

 [Version 5.0 - June 2016](5_0_release_notes.html)

Release notes for Rails 5.0.

 [Version 4.2 - December 2014](4_2_release_notes.html)

Release notes for Rails 4.2.

 [Version 4.1 - April 2014](4_1_release_notes.html)

Release notes for Rails 4.1.

 [Version 4.0 - June 2013](4_0_release_notes.html)

Release notes for Rails 4.0.

 [Version 3.2 - January 2012](3_2_release_notes.html)

Release notes for Rails 3.2.

 [Version 3.1 - August 2011](3_1_release_notes.html)

Release notes for Rails 3.1.

 [Version 3.0 - August 2010](3_0_release_notes.html)

Release notes for Rails 3.0.

 [Version 2.3 - March 2009](2_3_release_notes.html)

Release notes for Rails 2.3.

 [Version 2.2 - November 2008](2_2_release_notes.html)

Release notes for Rails 2.2.

 

---