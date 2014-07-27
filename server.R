library(shiny)

data <- read.table('counts.txt', sep=',', comment.char='', header=TRUE)

shinyServer(function(input, output) {
    output$table = renderTable({
        slice <- data[data$week == input$week,]
        if (input$no_hipsters) {
            slice <- slice[slice$total_users > 200,]
        }
        slice$score <- slice$weekend_users / slice$total_users
        slice <- slice[order(-slice$score), c('language', 'weekend_users', 'total_users', 'score')]
        slice <- head(slice, n=15)
        slice$rank <- cbind(rank=seq(1, nrow(slice)), slice)
    }, include.rownames=FALSE)
})
