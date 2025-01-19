```mermaid
graph TD
    %% Main Application Structure
    A[Application] --> B(react)
    A --> C(react-dom/client)
    A --> D[Components]
    E[Frontend] --> B
    E --> F(react-dom)
    E --> G[Pages]
    H[Controllers] --> B
    H --> I[Services]
    H --> J[Models]
    G --> B
    G --> O(react-router-dom)
    G --> H
    G --> L[Views]
    G --> M[Competitor Analysis]
    G --> N[Notifications]
    G --> K[UI Components]
    K --> B
    K --> P(react-icons/fa)
    D --> B
    D --> Q[Metric]
    I --> B
    I --> R(recharts)
    I --> S[ChartDataPoint]
    J --> B
    J --> T[Position]
    J --> Q
    U[Jobs] --> B
    V[Helpers] --> B
    W[Assets] --> B
    L --> B
    M --> B
    M --> X[Competitor Data]
    M --> Y[Competitor]
    M --> Z[OutlierVideo]
    N --> B
    N --> V
    N --> AA[Notification]
    X --> B
    X --> V
    X --> Y
    X --> Z
    AA --> AB(@hotwired/stimulus)
    AC[Stimulus Controllers] --> AB
    AC --> AD[Stimulus Actions]
    AC --> ACR[Controller Registration]
    AD --> AB
    AE[Error Handling] --> AB
    AE --> AEE[Error Handling]
    AF[BaseController] --> AG(ActionController::Base)
    AH[DashboardController] --> AF
    AH --> AHD[Dashboard Controller]
    AI[YouTube API Service] --> AL(google-apis-youtube_v3)
    AI --> AIY[YouTube API Service]
    AH --> AI
    AH --> AJ[Channel Analyzer]
    AJ --> AI
    AJ --> AJA[Channel Analysis]
    AJ --> AJR[Recommendations]
    AK[Data Visualizer] --> AM(gruff)
    AK --> AKC[Data Visualization]
    AN[Recommendations Engine] --> AJ
    AN --> ANR[Recommendations]

    %% Application Structure
    subgraph app[Application]
        direction LR
        
        subgraph assets[Assets]
            direction LR
            subgraph stylesheets[Stylesheets]
                AS1(application.tailwind.css)  %% app/assets/stylesheets/application.tailwind.css
                AS2(shadcn.css)  %% app/assets/stylesheets/shadcn.css
            end
            subgraph images[Images]
                IMAGES_E(.keep)  %% app/assets/images/.keep
            end
        end
        
        subgraph controllers[Controllers]
            subgraph api[API]
                subgraph v1[V1]
                    APIV1B(base_controller.rb)  %% app/controllers/api/v1/base_controller.rb
                    APIV1C(channels_controller.rb)  %% app/controllers/api/v1/channels_controller.rb
                end
            end
            subgraph concerns[Concerns]
                CONCERNS_C(.keep)  %% app/controllers/concerns/.keep
            end
        end
        
        subgraph helpers[Helpers]
            HELPERS_A(application_helper.rb)  %% app/helpers/application_helper.rb
        end
        
        subgraph javascript[JavaScript]
            JAVASCRIPT_A(application.ts)  %% app/javascript/application.ts
            JAVASCRIPT_B(application.tsx)  %% app/javascript/application.tsx
            subgraph components[Components]
                subgraph gui[GUI]
                    subgraph controllers[Controllers]
                        GUI_CONTROLLERS_A(App.tsx)  %% app/javascript/components/gui/controllers/App.tsx
                        GUI_CONTROLLERS_B(main.tsx)  %% app/javascript/components/gui/controllers/main.tsx
                    end
                    subgraph views[Views]
                        GUI_VIEWS_INDEX(index.css)  %% app/javascript/components/gui/views/index.css
                        subgraph components[Components]
                            GUI_VIEWS_COMPONENTS_A(Chart.tsx)  %% app/javascript/components/gui/views/components/Chart.tsx
                            GUI_VIEWS_COMPONENTS_B(CompetitorCard.tsx)  %% app/javascript/components/gui/views/components/CompetitorCard.tsx
                            GUI_VIEWS_COMPONENTS_C(Header.tsx)  %% app/javascript/components/gui/views/components/Header.tsx
                            GUI_VIEWS_COMPONENTS_D(MetricPopup.tsx)  %% app/javascript/components/gui/views/components/MetricPopup.tsx
                            GUI_VIEWS_COMPONENTS_E(Metrics.tsx)  %% app/javascript/components/gui/views/components/Metrics.tsx
                            GUI_VIEWS_COMPONENTS_F(MetricsCard.tsx)  %% app/javascript/components/gui/views/components/MetricsCard.tsx
                            GUI_VIEWS_COMPONENTS_G(MetricsDisplay.tsx)  %% app/javascript/components/gui/views/components/MetricsDisplay.tsx
                            GUI_VIEWS_COMPONENTS_H(Navbar.tsx)  %% app/javascript/components/gui/views/components/Navbar.tsx
                            GUI_VIEWS_COMPONENTS_I(RecommendationPopup.tsx)  %% app/javascript/components/gui/views/components/RecommendationPopup.tsx
                            subgraph ui[UI]
                                GUI_VIEWS_COMPONENTS_UI_A(button.jsx)  %% app/javascript/components/gui/views/components/ui/button.jsx
                                GUI_VIEWS_COMPONENTS_UI_B(card.jsx)  %% app/javascript/components/gui/views/components/ui/card.jsx
                                GUI_VIEWS_COMPONENTS_UI_C(table.jsx)  %% app/javascript/components/gui/views/components/ui/table.jsx
                            end
                        end
                        subgraph pages[Pages]
                            GUI_VIEWS_PAGES_A(Dashboard.tsx)  %% app/javascript/components/gui/views/pages/Dashboard.tsx
                            GUI_VIEWS_PAGES_B(Landing.tsx)  %% app/javascript/components/gui/views/pages/Landing.tsx
                            GUI_VIEWS_PAGES_C(Notifications.tsx)  %% app/javascript/components/gui/views/pages/Notifications.tsx
                            GUI_VIEWS_PAGES_D(Recommendations.tsx)  %% app/javascript/components/gui/views/pages/Recommendations.tsx
                        end
                    end
                end
            end
            subgraph controllers[Controllers]
                JAVASCRIPT_CONTROLLERS_A(application.ts)  %% app/javascript/controllers/application.ts
                JAVASCRIPT_CONTROLLERS_B(chart_controller.ts)  %% app/javascript/controllers/chart_controller.ts
                JAVASCRIPT_CONTROLLERS_C(hello_controller.ts)  %% app/javascript/controllers/hello_controller.ts
                JAVASCRIPT_CONTROLLERS_D(index.ts)  %% app/javascript/controllers/index.ts
                JAVASCRIPT_CONTROLLERS_E(metrics_controller.ts)  %% app/javascript/controllers/metrics_controller.ts
            end
        end
        
        subgraph jobs[Jobs]
            JOBS_A(application_job.rb)  %% app/jobs/application_job.rb
            JOBS_B(channel_analysis_job.rb)  %% app/jobs/channel_analysis_job.rb
        end
        
        subgraph mailers[Mailers]
            MAILERS_A(application_mailer.rb)  %% app/mailers/application_mailer.rb
        end
        
        subgraph models[Models]
            MODELS_A(application_record.rb)  %% app/models/application_record.rb
            subgraph concerns[Concerns]
                MODELS_CONCERNS_C(.keep)  %% app/models/concerns/.keep
                MODELS_CONCERNS_Y(youtube_channel_validator.rb)  %% app/models/concerns/youtube_channel_validator.rb
            end
        end
        
        subgraph operations[Operations]
            subgraph dashboard[Dashboard]
                OPERATIONS_DASHBOARD_F(fetch_metrics.rb)  %% app/operations/dashboard/fetch_metrics.rb
            end
        end
        
        subgraph services[Services]
            subgraph pipeline[Pipeline]
                SERVICES_PIPELINE_C(channel_service.rb)  %% app/services/pipeline/channel_service.rb
            end
        end
        
         subgraph bin[Bin]
            BIN_A(analyze_channel)  %% bin/analyze_channel
            BIN_B(brakeman)  %% bin/brakeman
            BIN_C(bundle)  %% bin/bundle
            BIN_D(bundle.cmd)  %% bin/bundle.cmd
            BIN_E(dev)  %% bin/dev
            BIN_F(docker-entrypoint)  %% bin/docker-entrypoint
            BIN_G(jobs)  %% bin/jobs
            BIN_H(kamal)  %% bin/kamal
            BIN_I(kamal.cmd)  %% bin/kamal.cmd
            BIN_J(rails)  %% bin/rails
            BIN_K(rake)  %% bin/rake
            BIN_L(rubocop)  %% bin/rubocop
            BIN_M(setup)  %% bin/setup
            BIN_N(test_app)  %% bin/test_app
            BIN_O(thrust)  %% bin/thrust
        end
        
        subgraph config[Config]
            CONFIG_A(application.rb)  %% config/application.rb
            CONFIG_B(boot.rb)  %% config/boot.rb
            CONFIG_C(cable.yml)  %% config/cable.yml
            CONFIG_D(cache.yml)  %% config/cache.yml
            CONFIG_E(credentials.yml.enc)  %% config/credentials.yml.enc
            CONFIG_F(database.yml)  %% config/database.yml
            CONFIG_G(deploy.yml)  %% config/deploy.yml
            CONFIG_H(environment.rb)  %% config/environment.rb
            CONFIG_I(puma.rb)  %% config/puma.rb
            CONFIG_J(queue.yml)  %% config/queue.yml
            CONFIG_K(recurring.yml)  %% config/recurring.yml
            CONFIG_L(routes.rb)  %% config/routes.rb
            CONFIG_M(shadcn.tailwind.js)  %% config/shadcn.tailwind.js
            CONFIG_N(storage.yml)  %% config/storage.yml
            subgraph environments[Environments]
                CONFIG_ENVIRONMENTS_A(development.rb)  %% config/environments/development.rb
                CONFIG_ENVIRONMENTS_B(production.rb)  %% config/environments/production.rb
                CONFIG_ENVIRONMENTS_C(test.rb)  %% config/environments/test.rb
            end
            subgraph initializers[Initializers]
                CONFIG_INITIALIZERS_A(assets.rb)  %% config/initializers/assets.rb
                CONFIG_INITIALIZERS_B(content_security_policy.rb)  %% config/initializers/content_security_policy.rb
                CONFIG_INITIALIZERS_C(filter_parameter_logging.rb)  %% config/initializers/filter_parameter_logging.rb
                CONFIG_INITIALIZERS_D(inflections.rb)  %% config/initializers/inflections.rb
                CONFIG_INITIALIZERS_E(sidekiq.rb)  %% config/initializers/sidekiq.rb
            end
            subgraph locales[Locales]
                CONFIG_LOCALES_A(en.yml)  %% config/locales/en.yml
            end
        end
        
        subgraph data[Data]
            DATA_A(README.md)  %% data/README.md
            DATA_B(youtube_gaming_channels.csv)  %% data/youtube_gaming_channels.csv
            DATA_C(youtube_gaming_channels.json)  %% data/youtube_gaming_channels.json
        end
        
        subgraph db[DB]
            DB_A(cable_schema.rb)  %% db/cable_schema.rb
            DB_B(cache_schema.rb)  %% db/cache_schema.rb
            DB_C(queue_schema.rb)  %% db/queue_schema.rb
            DB_D(schema.rb)  %% db/schema.rb
            DB_E(seeds.rb)  %% db/seeds.rb
        end
        
        subgraph docs[Docs]
            DOCS_A(01-API.md)  %% docs/01-API.md
            DOCS_B(02-GUI.md)  %% docs/02-GUI.md
            DOCS_C(03-Workers.md)  %% docs/03-Workers.md
            DOCS_D(04-Services.md)  %% docs/04-Services.md
            DOCS_E(05-Models.md)  %% docs/05-Models.md
            DOCS_F(06-Configuration.md)  %% docs/06-Configuration.md
            DOCS_G(07-Testing.md)  %% docs/07-Testing.md
            DOCS_H(08-Memory.md)  %% docs/08-Memory.md
            DOCS_I(09-Bin-Scripts.md)  %% docs/09-Bin-Scripts.md
            DOCS_J(10-TypeScript.md)  %% docs/10-TypeScript.md
            DOCS_K(CNV-1.png)  %% docs/CNV-1.png
            DOCS_L(CNV-1.svg)  %% docs/CNV-1.svg
            DOCS_M(CNV.md)  %% docs/CNV.md
            DOCS_N(FULL-DIAGRAM-1.png)  %% docs/FULL-DIAGRAM-1.png
            DOCS_O(FULL-DIAGRAM.md)  %% docs/FULL-DIAGRAM.md
            DOCS_P(FULL-DIAGRAM2-1.png)  %% docs/FULL-DIAGRAM2-1.png
            DOCS_Q(FULL-DIAGRAM5-1.png)  %% docs/FULL-DIAGRAM5-1.png
            DOCS_R(MMD-1.png)  %% docs/MMD-1.png
            DOCS_S(OVERALL-INTRO.md)  %% docs/OVERALL-INTRO.md
            subgraph images[Images]
                DOCS_IMAGES_A(system-design-1.png)  %% docs/images/system-design-1.png
                DOCS_IMAGES_B(system-design-1.svg)  %% docs/images/system-design-1.svg
                DOCS_IMAGES_C(system-design-2.png)  %% docs/images/system-design-2.png
                DOCS_IMAGES_D(system-design-2.svg)  %% docs/images/system-design-2.svg
                DOCS_IMAGES_E(system-design-3.png)  %% docs/images/system-design-3.png
                DOCS_IMAGES_F(system-design-3.svg)  %% docs/images/system-design-3.svg
                DOCS_IMAGES_G(system-design-4.png)  %% docs/images/system-design-4.png
                DOCS_IMAGES_H(system-design-4.svg)  %% docs/images/system-design-4.svg
                DOCS_IMAGES_I(system-design-5.png)  %% docs/images/system-design-5.png
                DOCS_IMAGES_J(system-design-5.svg)  %% docs/images/system-design-5.svg
                DOCS_IMAGES_K(system-design-6.png)  %% docs/images/system-design-6.png
                DOCS_IMAGES_L(system-design-6.svg)  %% docs/images/system-design-6.svg
            end
            subgraph official_documentations[Official Documentations]
                subgraph Hanami[Hanami]
                    DOCS_OFFICIAL_DOCUMENTATIONS_HANAMI_A(https-docs-hanamirb-org-1-3-1-.md)  %% docs/official_documentations/Hanami/https-docs-hanamirb-org-1-3-1-.md
                end
                subgraph MermaidJS[MermaidJS]
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_A(01-introduction.md)  %% docs/official_documentations/MermaidJS/01-introduction.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_B(02-node-shapes.md)  %% docs/official_documentations/MermaidJS/02-node-shapes.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_C(03-expanded-node-shapes.md)  %% docs/official_documentations/MermaidJS/03-expanded-node-shapes.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_D(04-links-between-nodes.md)  %% docs/official_documentations/MermaidJS/04-links-between-nodes.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_E(05-new-arrow-types.md)  %% docs/official_documentations/MermaidJS/05-new-arrow-types.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_F(06-multi-directional-arrows.md)  %% docs/official_documentations/MermaidJS/06-multi-directional-arrows.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_G(07-minimum-length-of-a-link.md)  %% docs/official_documentations/MermaidJS/07-minimum-length-of-a-link.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_H(08-special-characters.md)  %% docs/official_documentations/MermaidJS/08-special-characters.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_I(09-subgraphs.md)  %% docs/official_documentations/MermaidJS/09-subgraphs.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_J(10-markdown-strings.md)  %% docs/official_documentations/MermaidJS/10-markdown-strings.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_K(11-interaction.md)  %% docs/official_documentations/MermaidJS/11-interaction.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_L(12-styling-and-classes.md)  %% docs/official_documentations/MermaidJS/12-styling-and-classes.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_M(13-configuration.md)  %% docs/official_documentations/MermaidJS/13-configuration.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_N(https-mermaid-js-org-syntax-flowchart-html.md)  %% docs/official_documentations/MermaidJS/https-mermaid-js-org-syntax-flowchart-html.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_O(mermaid-api-request-flow.md)  %% docs/official_documentations/MermaidJS/mermaid-api-request-flow.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_P(mermaid-background-job-flow.md)  %% docs/official_documentations/MermaidJS/mermaid-background-job-flow.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_Q(mermaid-cli-github.md)  %% docs/official_documentations/MermaidJS/mermaid-cli-github.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_R(mermaid-component-interactions.md)  %% docs/official_documentations/MermaidJS/mermaid-component-interactions.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_S(mermaid-data-flow.md)  %% docs/official_documentations/MermaidJS/mermaid-data-flow.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_MERMAIDJS_T(mermaid-memory-structure.md)  %% docs/official_documentations/MermaidJS/mermaid-memory-structure.md
                end
                subgraph React[React]
                    DOCS_OFFICIAL_DOCUMENTATIONS_REACT_A(https-legacy-reactjs-org-docs-getting-started-html.md)  %% docs/official_documentations/React/https-legacy-reactjs-org-docs-getting-started-html.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_REACT_B(https-react-dev-.md)  %% docs/official_documentations/React/https-react-dev-.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_REACT_C(https-reactnative-dev-docs-getting-started.md)  %% docs/official_documentations/React/https-reactnative-dev-docs-getting-started.md
                end
                subgraph Ruby[Ruby]
                    DOCS_OFFICIAL_DOCUMENTATIONS_RUBY_A(https-www-ruby-lang-org-en-documentation-.md)  %% docs/official_documentations/Ruby/https-www-ruby-lang-org-en-documentation-.md
                end
                subgraph RubyOnRails[RubyOnRails]
                    DOCS_OFFICIAL_DOCUMENTATIONS_RUBYONRAILS_A(https-api-rubyonrails-org-.md)  %% docs/official_documentations/RubyOnRails/https-api-rubyonrails-org-.md
                    DOCS_OFFICIAL_DOCUMENTATIONS_RUBYONRAILS_B(https-guides-rubyonrails-org-.md)  %% docs/official_documentations/RubyOnRails/https-guides-rubyonrails-org-.md
                end
                subgraph ShadcnUI[ShadcnUI]
                    DOCS_OFFICIAL_DOCUMENTATIONS_SHADCNUI_A(shadcn.md)  %% docs/official_documentations/ShadcnUI/shadcn.md
                end
            end
        end
        
        subgraph views[Views]
            subgraph dashboard[Dashboard]
                VIEWS_DASHBOARD_C(chart.html.erb)  %% app/views/dashboard/_chart.html.erb
                VIEWS_DASHBOARD_CC(competitor_cards.html.erb)  %% app/views/dashboard/_competitor_cards.html.erb
                VIEWS_DASHBOARD_MD(metrics_display.html.erb)  %% app/views/dashboard/_metrics_display.html.erb
                VIEWS_DASHBOARD_M(metrics.html.erb)  %% app/views/dashboard/_metrics.html.erb
                VIEWS_DASHBOARD_N(navbar.html.erb)  %% app/views/dashboard/_navbar.html.erb
                VIEWS_DASHBOARD_I(index.html.erb)  %% app/views/dashboard/index.html.erb
                VIEWS_DASHBOARD_R(react.html.erb)  %% app/views/dashboard/react.html.erb
                VIEWS_DASHBOARD_V(app/views/dashboard/view.rb)  %% app/views/dashboard/view.rb
            end
            subgraph layouts[Layouts]
                VIEWS_LAYOUTS_A(application.html.erb)  %% app/views/layouts/application.html.erb
                VIEWS_LAYOUTS_M1(mailer.html.erb)  %% app/views/layouts/mailer.html.erb
                VIEWS_LAYOUTS_M2(mailer.text.erb)  %% app/views/layouts/mailer.text.erb
            end
            subgraph pwa[PWA]
                VIEWS_PWA_M(manifest.json.erb)  %% app/views/pwa/manifest.json.erb
                VIEWS_PWA_S(service-worker.js)  %% app/views/pwa/service-worker.js
            end
        end
        
        subgraph tmp[Tmp]
            TMP_A(.keep)  %% tmp/.keep
        end
        
        subgraph vendor[Vendor]
            VENDOR_A(.keep)  %% vendor/.keep
        end
    end

    %% Styling
    style app fill:#f9f,stroke:#333,stroke-width:2px
    style assets fill:#ccf,stroke:#333,stroke-width:2px
    style controllers fill:#cfc,stroke:#333,stroke-width:2px
    style helpers fill:#fcc,stroke:#333,stroke-width:2px
    style javascript fill:#ccf,stroke:#333,stroke-width:2px
    style jobs fill:#fcf,stroke:#333,stroke-width:2px
    style mailers fill:#ccf,stroke:#333,stroke-width:2px
    style models fill:#fcc,stroke:#333,stroke-width:2px
    style operations fill:#cfc,stroke:#333,stroke-width:2px
    style services fill:#ccf,stroke:#333,stroke-width:2px
    style views fill:#fcf,stroke:#333,stroke-width:2px
```