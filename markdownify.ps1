# Markdownify v0.5, written by Jasper E. Hunt
# Markdownify works in two steps: (i) Builds a new directory called 'md_stories', (ii) Finds each .txt file in the current directory and subdirectories, replaces BBCode syntax with Markdown syntax, and saves the modified files with the prefix 'md_' in the 'md_stories' directory.

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
