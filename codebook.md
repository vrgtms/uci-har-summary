# Codebook for UCI HAR Dataset summary

## The original UCI HAR Dataset

**Data source**: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

_from the README.txt provided in the source dataset_

## Transformation methods

The ```run_analysis.R``` script implements the following steps to create the summary using the source dataset:

1. Reads the training and test datasets, its label and subject datasets, measurement vector labels and activity labels.
2. Assigns the variable names to the measurement vectors.
3. Assigns the subject and activity labels to the measurements.
4. Merges the training and test datasets into one dataset.
5. Keeps only the mean and standard deviation variables for each measurement, drops others.
6. Changes the activity ids to descriptive labels.
7. Groups the measurements by activities and subjects, taking the mean value of each variables per group.
8. Writes the transformed dataset to a tabular text file.

## Variables

The summary has the following columns:
- **subject**: the id of the subject who carried out the experiment
- **activity**: the type of activity performed by the subject
- all other variables are the means of the measurements belonging to the given subject and activity you can find in the original dataset with the same feature names