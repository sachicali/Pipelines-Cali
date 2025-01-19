```mermaid
%%{init: {
  'flowchart': { 'curve': 'basis', 'nodeSpacing': 50, 'rankSpacing': 50, 'useMaxWidth': false },
  'theme': 'base',
  'themeVariables': {
    'fontFamily': 'arial',
    'fontSize': '16px'
  }
} }%%

graph LR
    %% Styles
    classDef default fill:#f9f9f9,stroke:#333,stroke-width:1px
    classDef frontend fill:#e3f2fd,stroke:#1565c0,stroke-width:2px
    classDef backend fill:#f3e5f5,stroke:#6a1b9a,stroke-width:2px
    classDef service fill:#fff3e0,stroke:#ef6c00,stroke-width:2px
    classDef data fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px

    %% Main Application Structure
    subgraph Frontend["Frontend Layer"]
        direction TB
        subgraph ReactCore["Core React"]
            A(application.tsx):::frontend
            B[react]
            C[react-dom/client]
            O[react-router-dom]
            P[react-icons/fa]
            R[recharts]
        end

        subgraph Pages["Page Components"]
            direction LR
            H(Dashboard.tsx):::frontend
            L(Landing.tsx):::frontend
            M(Recommendations.tsx):::frontend
            N(Notifications.tsx):::frontend
        end

        subgraph Components["UI Components"]
            direction LR
            D(MetricsCard.tsx):::frontend
            I(Metrics.tsx):::frontend
            J(MetricPopup.tsx):::frontend
            K(Header.tsx):::frontend
            X(CompetitorCard.tsx):::frontend
        end

        subgraph BaseUI["Base Components (ShadCN UI for Rails)"]
            direction LR
            U(button.jsx):::frontend
            V(card.jsx):::frontend
            W(table.jsx):::frontend
            note["Pre-styled components from<br/>ShadCN UI Rails port"]
        end

        subgraph Controllers["Frontend Controllers"]
            direction LR
            G(App.tsx):::frontend
            E(main.tsx):::frontend
            AA(application.ts):::frontend
            AC(index.ts):::frontend
            AD(hello_controller.ts):::frontend
            AE(metrics_controller.ts):::frontend
        end
    end

    subgraph Backend["Backend Services"]
        direction TB
        subgraph RubyCore["Core Ruby"]
            AF(ApplicationController.rb):::backend
            AH(DashboardController.rb):::backend
            AG[ActionController::Base]:::backend
        end

        subgraph YouTube["YouTube Services"]
            direction LR
            AI(YouTubeAnalytics.rb):::service
            AJ(YouTubeChannelAnalyzer.rb):::service
            AK(YouTubeDataVisualizer.rb):::service
            AN(YouTubeRecommendationsEngine.rb):::service
            AL[google-apis-youtube_v3]:::service
            AM[gruff]:::service
        end

        subgraph Assets["Asset Pipeline"]
            direction LR
            AS1(application.tailwind.css)
            AS2(shadcn.css)
        end
    end

    subgraph AllFiles["All Files"]
        direction LR
        classDef allfiles fill:#f0f0f0,stroke:#888,stroke-width:1px
        
        A1(CHANGELOG.md):::allfiles
        A2(Dockerfile):::allfiles
        A3(Dockerfile.dev):::allfiles
        A4(Gemfile):::allfiles
        A5(Gemfile.lock):::allfiles
        A6(Procfile.dev):::allfiles
        A7(README.md):::allfiles
        A8(Rakefile):::allfiles
        A9(app):::allfiles
        A10(application.css):::allfiles
        A11(shadcn.css):::allfiles
        A12(pipeline_channel.rb):::allfiles
        A13(base_controller.rb):::allfiles
        A14(channels_controller.rb):::allfiles
        A15(application_controller.rb):::allfiles
        A16(dashboard_controller.rb):::allfiles
        A17(application_helper.rb):::allfiles
        A18(application.ts):::allfiles
        A19(App.tsx):::allfiles
        A20(main.tsx):::allfiles
        A21(Chart.tsx):::allfiles
        A22(CompetitorCard.tsx):::allfiles
        A23(Header.tsx):::allfiles
        A24(MetricPopup.tsx):::allfiles
        A25(Metrics.tsx):::allfiles
        A26(MetricsCard.tsx):::allfiles
        A27(MetricsDisplay.tsx):::allfiles
        A28(Navbar.tsx):::allfiles
        A29(RecommendationPopup.tsx):::allfiles
        A30(button.jsx):::allfiles
        A31(card.jsx):::allfiles
        A32(table.jsx):::allfiles
        A33(index.css):::allfiles
        A34(Dashboard.tsx):::allfiles
        A35(Landing.tsx):::allfiles
        A36(Notifications.tsx):::allfiles
        A37(Recommendations.tsx):::allfiles
        A38(chart_controller.ts):::allfiles
        A39(hello_controller.ts):::allfiles
        A40(index.ts):::allfiles
        A41(metrics_controller.ts):::allfiles
        A42(application_job.rb):::allfiles
        A43(channel_analysis_job.rb):::allfiles
        A44(application_mailer.rb):::allfiles
        A45(application_record.rb):::allfiles
        A46(youtube_channel_validator.rb):::allfiles
        A47(fetch_metrics.rb):::allfiles
        A48(channel_service.rb):::allfiles
        A49(_chart.html.erb):::allfiles
        A50(_competitor_cards.html.erb):::allfiles
        A51(_metrics.html.erb):::allfiles
        A52(_metrics_display.html.erb):::allfiles
        A53(_navbar.html.erb):::allfiles
        A54(index.html.erb):::allfiles
        A55(react.html.erb):::allfiles
        A56(view.rb):::allfiles
        A57(application.html.erb):::allfiles
        A58(mailer.html.erb):::allfiles
        A59(mailer.text.erb):::allfiles
        A60(manifest.json.erb):::allfiles
        A61(service-worker.js):::allfiles
        A62(analyze_channel):::allfiles
        A63(brakeman):::allfiles
        A64(bundle):::allfiles
        A65(bundle.cmd):::allfiles
        A66(dev):::allfiles
        A67(docker-entrypoint):::allfiles
        A68(jobs):::allfiles
        A69(kamal):::allfiles
        A70(kamal.cmd):::allfiles
        A71(rails):::allfiles
        A72(rake):::allfiles
        A73(rubocop):::allfiles
        A74(setup):::allfiles
        A75(test_app):::allfiles
        A76(thrust):::allfiles
        A77(application.rb):::allfiles
        A78(boot.rb):::allfiles
        A79(cable.yml):::allfiles
        A80(cache.yml):::allfiles
        A81(credentials.yml.enc):::allfiles
        A82(database.yml):::allfiles
        A83(deploy.yml):::allfiles
        A84(environment.rb):::allfiles
        A85(development.rb):::allfiles
        A86(production.rb):::allfiles
        A87(test.rb):::allfiles
        A88(assets.rb):::allfiles
        A89(content_security_policy.rb):::allfiles
        A90(filter_parameter_logging.rb):::allfiles
        A91(inflections.rb):::allfiles
        A92(sidekiq.rb):::allfiles
        A93(en.yml):::allfiles
        A94(puma.rb):::allfiles
        A95(queue.yml):::allfiles
        A96(recurring.yml):::allfiles
        A97(routes.rb):::allfiles
        A98(shadcn.tailwind.js):::allfiles
        A99(storage.yml):::allfiles
        A100(config.ru):::allfiles
        A101(README.md):::allfiles
        A102(youtube_gaming_channels.csv):::allfiles
        A103(youtube_gaming_channels.json):::allfiles
        A104(cable_schema.rb):::allfiles
        A105(cache_schema.rb):::allfiles
        A106(queue_schema.rb):::allfiles
        A107(schema.rb):::allfiles
        A108(seeds.rb):::allfiles
        A109(docker-compose.yml):::allfiles
        A110(01-API.md):::allfiles
        A111(02-GUI.md):::allfiles
        A112(03-Workers.md):::allfiles
        A113(04-Services.md):::allfiles
        A114(05-Models.md):::allfiles
        A115(06-Configuration.md):::allfiles
        A116(07-Testing.md):::allfiles
        A117(08-Memory.md):::allfiles
        A118(09-Bin-Scripts.md):::allfiles
        A119(10-TypeScript.md):::allfiles
        A120(OVERALL-INTRO.md):::allfiles
        A121(https-docs-hanamirb-org-1-3-1-.md):::allfiles
        A122(01-introduction.md):::allfiles
        A123(mermaid-memory-structure.md):::allfiles
        A124(https-legacy-reactjs-org-docs-getting-started-html.md):::allfiles
        A125(https-reactnative-dev-docs-getting-started.md):::allfiles
        A126(https-www-ruby-lang-org-en-documentation-.md):::allfiles
        A127(https-api-rubyonrails-org-.md):::allfiles
        A128(https-guides-rubyonrails-org-.md):::allfiles
        A129(shadcn.md):::allfiles
        A130(esbuild.config.js):::allfiles
        A131(configuration.rb):::allfiles
        A132(youtube_recommendations_engine.rb):::allfiles
        A133(pipeline.rb):::allfiles
        A134(pipeline.rake):::allfiles
        A135(channel_analyzer_spec.rb):::allfiles
        A136(youtube_analytics_spec.rb):::allfiles
        A137(spec_helper.rb):::allfiles
        A138(application_system_test_case.rb):::allfiles
        A139(test_helper.rb):::allfiles
        A140(local_secret.txt):::allfiles
        A141(tree.txt):::allfiles
        A142(yarn.lock):::allfiles
    end


    %% Data Types
    Q{Metric}:::data
    S{ChartDataPoint}:::data
    T{Position}:::data
    Y{Competitor}:::data
    Z{OutlierVideo}:::data
    AA_NOTIF{Notification}:::data

    %% Core Dependencies
    A --> B & C & D
    E --> B & F & G
    H --> B & I & J
    G --> B & O & H & L & M & N & K
    K --> B & P
    I --> B & R
    
    %% Data Flow
    D -.-> Q
    I -.-> S
    J -.-> T & Q
    M -.-> Y & Z
    N -.-> AA_NOTIF
    X -.-> Y & Z

    %% Service Dependencies
    AI --> AL
    AJ --> AI
    AN --> AJ
    AK --> AM

    %% Controller Flow
    AA --> AB[stimulus]
    AC --> AB & AD
    AF --> AG
    AH --> AF & AI & AJ

    %% Status Messages
    AC -.- ERROR[Missing controller registration]
    AE -.- ERR2[Handles loading states]
    AH -.- ERR3[Prepares metrics & data]
    AI -.- ERR4[Fetches YouTube data]
    AJ -.- ERR5[Analyzes metrics]
    AJ -.- ERR6[Generates recommendations]
    AK -.- ERR7[Generates charts]
    AN -.- ERR8[Optimizes growth]

    %% Link Styling
    linkStyle default stroke:#666,stroke-width:1px
    linkStyle 0,1,2,3,4,5 stroke:#1565c0,stroke-width:2px
    linkStyle 6,7,8,9,10 stroke:#6a1b9a,stroke-width:2px
    ```
