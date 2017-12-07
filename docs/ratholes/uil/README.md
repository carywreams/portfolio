# UIL
Every two years, the governing body for public secondary school sports uses attendance figures to 
create the classifications and districts of competition for the schools in the state of Texas.

Wanting to learn more about R, the publication of enrollment figures offers a nice large dataset
(> 1400 entries) to use as a training ground. R offers some of its own canned sets, but I work
better when I have some personal context for the data. In this case, Texas High School Football
 (```#txhsfb``).

## Data Source and Prep
+ Obtained original report from Texas UIL, as a PDF
+ Used a tool to convert the PDF to PS, then to TXT
+ basic editor allowed for formatting the resulting file as a CSV
+ slurped the CSV with a spreadsheet, manually corrected any column disparities, then saved as CSV for R

## Pass One with R
