# This file serves as a basic example.
# Adapt all filepaths to your needs.
# This script will export a report for each file under $StartPath.

## Info: Consider Depth to scan (based on Input Path)
## C:\Data = 2
## $StartPath = 3 (C:\Data\Project_Files)

#region Config (Change here)

  $BasePath = "C:\Data"
  $StartPath = "$BasePath\Project_Files"
  $OutputPath = "$BasePath\Reports"
  $SkipPaths = @("Project_42","Project_21") # optional
  $ImportPath = "C:\Temp\Get-FolderSizes.ps1"
  $Depth = 5
  
#endregion Config


#region Runtime (Do not change here)

  # Import script first
  . $ImportPath
  
  # Get all folders to do and count them
  $allFoldersToDo = Get-ChildItem -Path $StartPath -Directory
  $folderCount = $allFoldersToDo.count
  Write-Host -ForegroundColor Yellow "Reporting $folderCount Folders"
  
  # Report each folder
  $currentCount = 0
  foreach($current in $allFoldersToDo){
  	if($($current.Name) -in $SkipPaths){
          Write-Host
          Write-Host -ForegroundColor Cyan "=== Skipping Folder $($currentCount+1): $($current.FullName) ==="
          $currentCount++
  		continue
  	}
  	else{
          Write-Host
          Write-Host -ForegroundColor Cyan "=== Reporting Folder $($currentCount+1): $($current.FullName) ==="
  		Get-FolderSizes -StartingPath $current.FullName -OutputPath $OutputPath -Depth $Depth -Verbose
          $currentCount++
  	}
  }
  
  # Finish report
  Write-Host
  Write-Host -ForegroundColor Green "=== All Done! $(Get-Date -Format dd.MM.yyyy_HH:mm) ==="
  
#endregion Runtime
