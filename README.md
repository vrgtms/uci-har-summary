# Summary of the UCI HAR Dataset

The dataset ```uci_har_summary.txt``` created by the script ```run_analysis.R``` is the summary of the original [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This summary contains the means of the means and standard deviations for each measurement grouped by the subjects and the activity types.

## Columns

The summary has the following columns:
- **subject**: the id of the subject who carried out the experiment
- **activity**: the type of activity performed by the subject
- all other variables are the means of the measurements you can find in the original dataset with the same feature name belonging to the subject and activity

## Reproducing the summary
1. Install the ```dplyr``` R package
2. Download the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and unzip it into the same folder where the ```run_analysis.R``` is
3. Run the ```run_analysis.R``` script. You can find the created ```uci_har_summary.txt``` file in the same folder.