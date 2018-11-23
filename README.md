# Summary of the UCI HAR Dataset

The dataset ```uci_har_summary.txt``` created by the script ```run_analysis.R``` is the summary of the original [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This summary contains the averages of the means and standard deviations for each measurement grouped by the subjects and the activity types.

## Files
- ```run_analysis.R```: The script to run for perform the analysis
- ```codebook.md```: Codebook for the summary file. Describes the variables and the transformation methods
- ```uci_har_summary.txt```: After running the analysis this file contains the analysis results

## Creating the summary
Run the ```run_analysis.R``` script. It downloads and unzip the UCI HAR dataset if it's not already prepared, installs the dplyr R package if needed, performs the analysis and writes the results to the ```uci_har_summary.txt``` text file.