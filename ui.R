library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Top weekend languages on GitHub in June 2014"),
    sidebarPanel(
        withMathJax(),
        selectInput('week', "Select a week:", c('June 1 - 7'=1, 'June 8 - 14'=2, 'June 15 - 21'=3, 'June 22 - 28'=4)),
        checkboxInput('no_hipsters', "Exclude fringe languages? (< 200 users)", TRUE),
        hr(),
        h4("How is a language's score computed?"),
        p("Pretty arbitrarily. :)"),
        p("Let \\(U_{\\textrm{weekend}} = \\) the number of unique users committing to a repo whose primary language is that language during the weekend"),
        p("Let \\(U_{\\textrm{week}} = \\) the number of unique users committing to a repo whose primary language is that language during the whole week"),
        p("$$\\textrm{score} = \\frac{U_{\\textrm{weekend}}}{U_{\\textrm{week}}} \\times 100$$"),
        p("Data from ", a("Github Archive", href="http://www.githubarchive.org/"), ".")
    ),
    mainPanel(
        tableOutput('table')
    )
))
