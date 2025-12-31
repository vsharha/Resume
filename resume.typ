#let name = "Viktor Sharha"
#let phone = "+44 7771 432 765"
#let email = "vsharha07@gmail.com"
#let github = "vsharha"
#let linkedin = "vsharha"
#let personal-site = "viktorsharha.com"

#set document(
  title: "Viktor Sharha (Resume)",
  author: "Viktor Sharha"
)

#set page(
  paper: "a4",
  margin: (top: 0.2in, bottom: 0.2in, left: 0.2in, right: 0.2in)
)

#set text(
  font: "New Computer Modern",
  size: 10pt,
  lang: "en",
  ligatures: false
)

#let custom-title(title, body) = {
  v(-0.3em)
  [= #title]
  pad(left: 0.15in)[#body]
  v(-0.5em)
}

#let period_worked(start-date, end-date) = {
  assert.eq(type(start-date), datetime)
  assert(type(end-date) == datetime or type(end-date) == str)

  if type(end-date) == str and end-date == "Present" {
    end-date = datetime.today()
  }

  return [
      #start-date.display("[month repr:short] [year]") --
      #if (
        (end-date.month() == datetime.today().month()) and
        (end-date.year() == datetime.today().year())
      ) [
        Present
      ] else [
        #end-date.display("[month repr:short] [year]")
      ]
  ]
}

#let education-heading(institution, location, degree, major, start-date, end-date, body) = {
  grid(
    columns: (70%, 30%),
    align(left)[*#institution* \ #emph[#degree, #major]],
    align(right)[*#location* \ #period_worked(start-date, end-date)]
  )
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}

#let work-heading(company, title, location, start-date, end-date, body) = {
  grid(
    columns: (1fr, 1fr),
    align(left)[*#title* \ #emph[#company]],
    align(right)[*#period_worked(start-date, end-date)* \ #emph(location)]
  )
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}

#let skills(body) = {
  if body != [] {
    set par(leading: 0.6em)
    set list(
      body-indent: 0.1em,
      indent: 0em,
      marker: []
    )
    body
  }
}

#show heading.where(level: 1): it => block(width: 100%)[
  #set text(12pt, weight: "regular")
  #smallcaps(it.body)
  #v(-1em)
  #line(length: 100%, stroke: stroke(thickness: 0.4pt))
  #v(-0.2em)
]

#align(center)[
  #text(size: 25pt, weight: "extrabold")[Viktor Sharha]
  #v(-2em)
]

#align(center)[
  #text(size: 10pt)[Computer Science Student  — AI & Product Engineering]
]

#align(center, text(9.2pt)[
  #{
    let sepSpace = 0.2em
    let items = (
      phone,
      underline(link("mailto:" + email)[#email]),
      underline(link("https://linkedin.com/in/" + linkedin)[linkedin.com/in/#linkedin]),
      underline(link("https://github.com/" + github)[github.com/#github]),
      underline(link("https://" + personal-site)[#personal-site]),
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
    "VDrive Edinburgh",
    "Co-Founder & Operations",
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
  #block[
    #grid(
      columns: (1fr, auto),
      align(left)[*First Place, OpenEuler Challenge*],
      align(right)[*Oct 2025*]
    )
    #v(-0.5em)
    #grid(
      columns: (1fr, auto),
      align(left)[_Won competitive university-wide hackathon with Samantha OS Assistant_],
      align(right)[_Edinburgh, Scotland_]
    )
    #v(-0.2em)
  ]

  #block[
    #grid(
      columns: (1fr, auto),
      align(left)[*Third Place, Teachathon*],
      align(right)[*Oct 2025*]
    )
    #v(-0.5em)
    #grid(
      columns: (1fr, auto),
      align(left)[_Placed 3rd in educational technology competition with GradeIQ, an AI-powered grading platform_],
      align(right)[_Edinburgh, Scotland_]
    )
    #v(-0.2em)
  ]
]

#custom-title("Technical Projects")[
  #block[
    #grid(
      columns: (1fr, auto),
      align(left)[*Optiver Trading Challenge* | #emph[Python, BERT, NLP, Algorithmic Trading]],
      align(right)[Nov 2025]
    )
    #v(-0.5em)
    _2nd on leaderboard at Hacktheburgh algorithmic trading competition (30+ teams)_
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Led sentiment analysis component for trading bot in 24-hour competition (team of 6), helping secure 2nd place finish
    - Implemented BERT-based model for real-time financial sentiment scoring; algorithm held 1st place for majority of competition
  ]

  #block[
    #grid(
      columns: (1fr, auto),
      align(left)[*World on Fire* | #emph[Next.js, React, FastAPI, Supabase, Leaflet]],
      align(right)[Nov 2025]
    )
    #v(-0.5em)
    _Real-time global news heatmap visualizing breaking news across 100+ cities (24 hour hackathon project)_
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Built interactive news visualization platform with real-time updates (30-second intervals) and sentiment-based heat mapping using Leaflet and React
    - Developed automated news aggregation pipeline with 10-minute RSS feed ingestion, VADER sentiment analysis, and geocoding with database caching for 100+ global cities
    - Architected full-stack application with FastAPI backend and Supabase PostgreSQL for article deduplication and efficient aggregation queries
  ]

  #block[
    #grid(
      columns: (1fr, auto),
      align(left)[*GradeIQ* | #emph[Next.js, React, FastAPI, Supabase, Claude/Gemini AI]],
      align(right)[Oct 2025]
    )
    #v(-0.5em)
    _AI-powered grading platform automating academic assessment - 3rd place at Teachathon (2-week sprint)_
    #v(-0.4em)
    #set par(leading: 0.6em)
    #set list(indent: 0.5em)
    - Co-developed full-stack platform (team of 2) enabling instructors to create custom rubrics and grade student submissions using AI, with real-time status updates for background processing jobs
    - Built responsive interface with PDF viewing, bulk submission management, and dynamic rubric creation using React and shadcn/ui component library
    - Implemented secure FastAPI backend with non-blocking AI grading via Claude/Gemini APIs and JWT authentication through Supabase
  ]

  #block[
    #grid(
      columns: (1fr, auto),
      align(left)[*Samantha OS Assistant* | #emph[Python, OpenAI API, Linux System Programming]],
      align(right)[Oct 2025]
    )
    #v(-0.5em)
    _1st place at OpenEuler Challenge - natural language CLI assistant for Linux system operations_
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
    - *Frameworks & Libraries:* HTML5, CSS3, React, Next.js, FastAPI, Tailwind CSS, Redux, Supabase, JWT/Auth, Playwright, Selenium
    - *Tools & Platforms:* Git, Linux, Docker, REST APIs, CI/CD, Cloudflare, OpenAI/Anthropic APIs
    - *Web Technologies:* Responsive Design, REST, WebSockets
  ]
]
