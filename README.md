
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![R-CMD-check](https://github.com/hrbrmstr/inoreadr/workflows/R-CMD-check/badge.svg)](https://github.com/hrbrmstr/inoreadr/actions?query=workflow%3AR-CMD-check)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/inoreadr.svg?branch=master)](https://travis-ci.org/hrbrmstr/inoreadr)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/inoreadr/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/inoreadr)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# inoreadr

Access and Orchestrate Inoreader Feeds, Preferences, and Metadata

## Description

Inoreader is a powerful content reading platform, which allows you to
discover and consume relevant information on any topic. It can convert
any meaningful information stream into a feed and the content is curated
and served at a single and convenient place. Tools are provided to
access and orchestrate feeds, preferences, and metadata.

## What’s Inside The Tin

The following functions are implemented:

-   `ino_add_feed`: Subscribe to feeds
-   `ino_auth`: Authenticate to Inoreader’s API
-   `ino_edit_subscription`: Edit subscription
-   `ino_folder_tag_list`: Fetches the current folders and tags for the
    logged-in user
-   `ino_stream_contents`: Returns the articles for a given collection
-   `ino_unread_counts`: Retrieve unread counters for folders, tags and
    feeds.
-   `ino_user`: Retrieve basic information about the logged in user

### TODO

Implement the following API endpoints:

-   Item IDs
-   Stream preferences list
-   Stream preferences set
-   Rename tag
-   Delete tag
-   Edit tag
-   Mark all as read
-   Create active search
-   Delete active search

## Installation

``` r
remotes::install_github("hrbrmstr/inoreadr")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(inoreadr)

# current version
packageVersion("inoreadr")
## [1] '0.1.0'
```

## inoreadr Metrics

| Lang | # Files |  (%) | LoC |  (%) | Blank lines |  (%) | # Lines |  (%) |
|:-----|--------:|-----:|----:|-----:|------------:|-----:|--------:|-----:|
| R    |      10 | 0.38 | 140 | 0.38 |          50 | 0.32 |      89 | 0.34 |
| YAML |       2 | 0.08 |  35 | 0.10 |          10 | 0.06 |       2 | 0.01 |
| Rmd  |       1 | 0.04 |   8 | 0.02 |          18 | 0.12 |      39 | 0.15 |
| SUM  |      13 | 0.50 | 183 | 0.50 |          78 | 0.50 |     130 | 0.50 |

clock Package Metrics for inoreadr

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
