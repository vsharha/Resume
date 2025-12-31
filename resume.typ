#import "@preview/simple-technical-resume:0.1.1": *

#let name = "Viktor Sharha"
#let phone = "+44 7771 432 765"
#let email = "vsharha07@gmail.com"
#let github = "vsharha"
#let linkedin = "vsharha"
#let personal-site = "viktorsharha.com"

#show: resume.with(
  top-margin: 0.2in,
  bottom-margin: 0.2in,
  left-margin: 0.2in,
  right-margin: 0.2in,
  personal-info-font-size: 9.2pt,
  author-position: center,
  personal-info-position: center,
  author-name: "",
  phone: "",
  email: "",
  website: "",
  linkedin-user-id: "",
  github-username: ""
)

#align(center)[
  #text(size: 27pt, weight: "extrabold")[Viktor Sharha]
  #v(-2em)
]

#align(center, text(9.2pt)[
  #{
    let sepSpace = 0.2em
    let items = (
      phone,
      underline(link("mailto:" + email)[#email]),
      underline(link("https://" + personal-site)[#personal-site]),
      underline(link("https://linkedin.com/in/" + linkedin)[linkedin.com/in/#linkedin]),
      underline(link("https://github.com/" + github)[github.com/#github]),
    )
    items.filter(x => x != none).join([
      #show "|": sep => {
        h(sepSpace)
        [|]
        h(sepSpace)
      }
      |
    ])
  }
])

#align(center)[
  #text(size: 9pt)[Computer Science Student | AI & Product Engineering]
]

#custom-title("Education")[
  #education-heading(
    "University of Edinburgh", "Edinburgh, Scotland",
    "BEng Computer Science", "First Year: 85% Average (A Grade)",
    datetime(year: 2024, month: 9, day: 1),
    datetime(year: 2028, month: 5, day: 1)
  )[
    - *Exceptional Performance:* Introduction to Computation (100% - A1), Introduction to Linear Algebra (93% - A1)
    - *Relevant Coursework:* Object-Oriented Programming, Algorithms & Data Structures, Cognitive Science, Calculus
  ]
]

#custom-title("Experience")[
  #work-heading(
    "Co-Founder & Operations",
    "VDrive Edinburgh",
    "Edinburgh, Scotland",
    datetime(year: 2025, month: 6, day: 1),
    "Present"
  )[
    - Co-founded automotive service business, scaling to 50+ monthly appointments while managing all technology operations and digital infrastructure
    - Built and deployed "Zenparse" - AI-powered document processing system handling 500+ invoices/receipts annually with 98% accuracy, reducing monthly bookkeeping time by 95% (5 hours to 15 minutes)
    - Commercializing Zenparse as B2B SaaS product targeting small businesses with similar accounting automation needs
  ]
]

#custom-title("Awards & Achievements")[
  #work-heading(
    "First Place, OpenEuler Challenge",
    "Won competitive university-wide hackathon with Samantha OS Assistant",
    "Edinburgh, Scotland",
    datetime(year: 2025, month: 10, day: 1),
    datetime(year: 2025, month: 10, day: 1)
  )[]

  #work-heading(
    "Third Place, Teachathon",
    "Placed 3rd in educational technology competition with GradeIQ, an AI-powered grading platform",
    "Edinburgh, Scotland",
    datetime(year: 2025, month: 10, day: 1),
    datetime(year: 2025, month: 10, day: 1)
  )[]
]

#custom-title("Technical Projects")[
  #block[
    *Optiver Trading Challenge* | #emph[Python, BERT, NLP, Algorithmic Trading]
    #v(-0.2em)
    _2nd on leaderboard at Hacktheburgh algorithmic trading competition (30+ teams)_ #h(1fr) November 2025
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Led sentiment analysis component for trading bot in 24-hour competition (team of 6), helping secure 2nd place finish
    - Implemented BERT-based model for real-time financial sentiment scoring; algorithm held 1st place for majority of competition
  ]

  #block[
    *World on Fire* | #emph[Next.js, React, FastAPI, Supabase, Leaflet]
    #v(-0.2em)
    _Real-time global news heatmap visualizing breaking news across 100+ cities (24 hour hackathon project)_ #h(1fr) November 2025
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Built interactive news visualization platform with real-time updates (30-second intervals) and sentiment-based heat mapping using Leaflet and React
    - Developed automated news aggregation pipeline with 10-minute RSS feed ingestion, VADER sentiment analysis, and geocoding with database caching for 100+ global cities
    - Architected full-stack application with FastAPI backend and Supabase PostgreSQL for article deduplication and efficient aggregation queries
  ]

  #block[
    *GradeIQ* | #emph[Next.js, React, FastAPI, Supabase, Claude/Gemini AI]
    #v(-0.2em)
    _AI-powered grading platform automating academic assessment - 3rd place at Teachathon (2-week sprint)_ #h(1fr) October 2025
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Co-developed full-stack platform (team of 2) enabling instructors to create custom rubrics and grade student submissions using AI, with real-time status updates for background processing jobs
    - Built responsive interface with PDF viewing, bulk submission management, and dynamic rubric creation using React and shadcn/ui component library
    - Implemented secure FastAPI backend with non-blocking AI grading via Claude/Gemini APIs and JWT authentication through Supabase
  ]

  #block[
    *Samantha OS Assistant* | #emph[Python, OpenAI API, Linux System Programming]
    #v(-0.2em)
    _1st place at OpenEuler Challenge - natural language CLI assistant for Linux system operations_ #h(1fr) October 2025
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Built conversational command-line interface converting natural language to system commands, handling file management, diagnostics, and web research with safety confirmations for destructive operations
    - Designed extensible agent framework with 5+ specialized tools including API integrations and automatic retry mechanisms for robust operation chaining
  ]
]

#custom-title("Technical Skills")[
  #skills()[
    - *Languages:* Python, JavaScript/TypeScript, Go, Java, C++, SQL, Bash
    - *Frameworks & Libraries:* React, Next.js, FastAPI, Tailwind CSS, Redux, Supabase, JWT/Auth, Playwright, Selenium
    - *Tools & Platforms:* Git, Linux, Docker, REST APIs, CI/CD, Cloudflare, OpenAI/Anthropic APIs
    - *Web Technologies:* HTML5, CSS3, Responsive Design, REST, WebSockets
  ]
]
