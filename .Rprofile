
options(

    # Set default CRAN repo
    "repos" = c(CRAN = "https://www.stats.bris.ac.uk/R"),

    # Automatically set width if terminal size changes
    setWidthOnResize = TRUE,

    # Set UserAgent to enable binary package installation from posit-package manager
    HTTPUserAgent = sprintf(
        "R/%s R (%s)",
        getRversion(),
        paste(
            getRversion(),
            R.version["platform"],
            R.version["arch"],
            R.version["os"]
        )
    )
)
