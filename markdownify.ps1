New-Item -Path . -Name md_stories -ItemType "directory"

$stories = Get-ChildItem . *.txt -rec
foreach ($file in $stories)
{
   (Get-Content $file.PSPath) | Foreach-Object {
      $_ -replace "\*", '\*' `
         -replace "\[i\]", "*" `
         -replace "\[/i\]", "*" `
         -replace "\[b\]", "**" `
         -replace "\[/b\]", "**" `
         -replace "\[u\]", '<u>' `
         -replace "\[/u\]", '</u>' `
         -replace "\[center\]", '<div class="align-center">' `
         -replace "\[/center\]", '</div>' `
         -replace "\[left\]", '<div class="align-left">' `
         -replace "\[/left\]", '</div>' `
         -replace "\[right\]", '<div class="align-right">' `
         -replace "\[/right\]", '</div>' `
         -replace "\[h1\]", '# ' `
         -replace "\[/h1\]", '' `
         -replace "\[h2\]", '## ' `
         -replace "\[/h2\]", '' `
         -replace "\[h3\]", '### ' `
         -replace "\[/h3\]", '' `
         -replace "\[h4\]", '#### ' `
         -replace "\[/h4\]", '' `
         -replace "\[h5\]", '##### ' `
         -replace "\[/h5\]", '' `
         -replace "\[h6\]", '###### ' `
         -replace "\[/h6\]", '' `
      } | Set-Content .\md_stories\"md_$file"
}