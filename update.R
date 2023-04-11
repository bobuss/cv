rmarkdown::render(input = "resume.Rmd",
    output_file = "_dist/index.html",
    output_options = list(
        css = c('css/custom_resume.css', 'css/styles_html.css', 'resume'),
        self_contained = FALSE
    ),
    params = list(
        doctype = "HTML"
    )
)

rmarkdown::render(input = "resume.Rmd",
    output_file = "_dist/resume_pdf.html",
    output_options = list(
        css = c('css/custom_resume.css', 'css/styles_pdf.css', 'resume')
    ),
    params = list(
        doctype = "PDF"
    )
)
