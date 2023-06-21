# Markdownify

Markdownify is a tool for authors to convert .txt files from BBCode syntax to Markdown syntax. The Markdownify script is written for Windows PowerShell and thus will not work easily on UNIX systems.

This ReadMe file assumes the user is familiar with the very basics of using a command line/terminal prompt, such as navigating to a certain folder by using the command 'cd'.

This tool was written by Jasper E. Hunt (JasperEHunt) on the 24th of May, 2023, and is distributed for free.

## Usage

Place the Markdownify script in a folder which contains all of the stories you would like to convert to Markdown. It is acceptable if the stories are in subdirectories. For instance:

```
my-stories/
├── 2022/
│   ├── harrypotter_fanfic.txt
│   └── original_vampire_story_donotsteal.txt
├── 2023/
│   └── romance_stories/
│       ├── kafka_thetrial_butinAlabama.txt
│       └── breakfast_at_lowe's.txt
└── markdownify.ps1
```

Launch Windows PowerShell as an administrator and set the execution policy to allow for local unsigned scripts to be run. If you don't know how to do that, see the section on "How to Configure PowerShell" below.

In PowerShell, navigate to the folder containing Markdownify, then run it with the following command:
    .\markdownify.ps1

Once Markdownify has finished running, the resulting directory structure will look like this:

```
my-stories/
├── 2022/
│   ├── harrypotter_fanfic.txt
│   └── original_vampire_story_donotsteal.txt
├── 2023/
│   └── romance_stories/
│       ├── kafka_thetrial_butinAlabama.txt
│       └── breakfast_at_lowe's.txt
├── md_stories/
│   ├── md_harrypotter_fanfic.txt
│   ├── md_original_vampire_story_donotsteal.txt
│   ├── md_kafka_thetrial_butinAlabama.txt
│   └── md_breakfast_at_lowe's.txt
└── markdownify.ps1
```

All files in the 'md_stories' directory (i.e., the files beginning with the 'md_' prefix) are files which have successfully been converted from BBCode to Markdown. You're done! Open one up to check that the script executed successfully.

## Functionality/Limitations

Markdownify will convert the following BBCode tags to the corresponding Markdown syntax:
* Headers: [h1], [h2], [h3], [h4], [h5], [h6], [/h1], [/h2], [/h3], [/h4], [/h5], [/h6]
* Text alignment: [center], [/center], [left], [/left], [right], [/right]
* Italics: [i], [/i]
* Bold: [b], [/b]
* Underline: [u], [/u] -- NOTE: Because Markdown does not have native tags to underline text, Markdownify will replace [u] and [/u] with the following HTML tags: `<u>`, `</u>`. In a future update, I will make this behaviour toggle-able, with an optional argument to specify how Markdownify shall treat underline tags.

Markdownify will also add an escape character before any preexisting asterisks, to prevent them from displaying in unintended ways.

## How to Configure PowerShell

By default, PowerShell will only allow users to run signed PowerShell scripts. This is a security feature that should not be taken lightly! However, the Markdownify script is unsigned and so we will need to (temporarily) tell PowerShell that it is okay to run local, unsigned scripts. Before you do any of the following, be doubly -- even triply -- sure that you downloaded your copy of Markdownify from a trusted source.

To configure PowerShell to run unsigned local scripts, first launch PowerShell as an administrator. (You can go to the start menu, search for "Windows PowerShell", right-click, and select 'Run as administrator'.)

Once you have PowerShell running as an administrator, enter the following command:
    Set-ExecutionPolicy RemoteSigned -Scope Process

This sets PowerShell's execution policy to allow unsigned local scripts and signed remote scripts to run. Now, you can run Markdownify. Be sure to close the PowerShell window once you are done, which will restore the default execution policies for the next time you open a PowerShell window.

## License

Markdownify is distributed under an [MIT](https://choosealicense.com/licenses/mit/) license.
