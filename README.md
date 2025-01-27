# Interactive Folder Size Reporter

A PowerShell tool that generates detailed, interactive HTML reports of folder sizes with advanced sorting and filtering capabilities.

## Features

- Interactive sorting by folder name, size, and last modified date
- Search/filter functionality for folders
- Responsive design with alternating row colors
- Size formatting in appropriate units (B, KB, MB, GB, TB)
- Progress tracking for long operations
- Configurable minimum size filter and folder depth
- Summary statistics including total size and folder count

## Requirements

- PowerShell 5.1 or later

## Installation

Clone or download the script to your local machine.

## Usage

Basic usage:
```powershell
Get-FolderSizes -StartingPath "C:\Users\myUser" -OutputPath "C:\Temp\Report" -Depth 5
```

### Parameters

| Parameter     | Description                                           | Default          |
|---------------|-------------------------------------------------------|------------------|
| StartingPath  | Root path to analyze                                  | C:\Temp\         |
| OutputPath    | HTML report save location                             | C:\Temp\         |
| SortBy        | Initial sort column ('Folder Name','Last Change','Size') | Size             |
| MinSize       | Minimum file size in bytes to include                 | 102400 (100KB)   |
| Depth         | Maximum folder depth to analyze                       | 3                |
| IncludeZero   | Include empty folders and those below MinSize         | False            |
| ShowResults   | Auto-open report in default browser                   | False            |

### Examples

```powershell
# Basic usage with default parameters
Get-FolderSizes

# Analyze specific path with custom depth
Get-FolderSizes -StartingPath "C:\Users\myUser" -OutputPath "C:\Temp\Report" -Depth 5

# Include small/empty folders and show results
Get-FolderSizes -IncludeZero -ShowResults
```
