EScrape
================

This is a simple package for scraping data from the web-interface of the
ESBase database at the Swedish Museum of Natural History. Note that the
database is only accessible from within the museum’s local network.
Searching in ESBase is slow, expect a few seconds for each accession.

Install with

``` r
devtools::install_github("https://github.com/mskoldSU/EScrape")
```

### Sample session

``` r
library(EScrape)
# Open a connection
con <- ESB_connection("userid", "password") # Your ESBase credentials
# Download accession data
sample_accessions <- c("C2020/03034", "A2019/05277", "A2020/05904")
data <- ESB_read_accession(con, sample_accessions)
tibble::glimpse(data)
```

    ## Rows: 3
    ## Columns: 13
    ## $ catalog             <chr> "Fisk", "Däggdjur", "Däggdjur"
    ## $ accnr               <chr> "C2020/03034", "A2019/05277", "A2020/05904"
    ## $ species             <chr> "Abborre", "Utter", "Knubbsäl"
    ## $ project             <chr> "Miljöövervakning, Marina 2020 NRM", "Statens vilt…
    ## $ arrived_date        <chr> "2020-09-09", "2019-04-26", "2015-09-15"
    ## $ found_date_start    <chr> "2020-08-04", "2019-02-02", "2015-08-18"
    ## $ found_date_end      <chr> "2020-08-11", "", ""
    ## $ found_circumstances <chr> "Insamlad", "Trafik", "Jakt"
    ## $ found_note          <chr> "", "", "Skjuten"
    ## $ found_place         <chr> "Örefjärden", "Väg (oklart vilken) vid Landögssjön…
    ## $ latitude            <dbl> 63.54083, 63.58263, 58.76667
    ## $ longitude           <dbl> 19.85867, 14.17888, 11.16667
    ## $ accession_note      <chr> "Ingår i serien C2020/03034-03060", "Ankomstdatum …
