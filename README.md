![](https://github.com/fixitgearware/compfile/blob/main/compfile_banner.png)
<br>
<br>
<strong>"Compfile"</strong> is a tool designed by fixitgearwaresecurity for comparing large recon text files for changes that exist between the old file and the new file, or seperate multiple recon text files that needed to be filtered of duplicates. Inspired by Tomnomnom 'anew' and the challenges faced by users. The difference in compfile, is that compfile sorts the output textfile, giving the user of this tool a structured textfile output, and more...
<br>
# POWER OF COMPFILE
<li>
The user of this tool have the flexibility to pull the two different text file paths being compared, irrespective of these textfiles not sitting in the same directory or file system.
</li>
<li>
The user of this tool have the power to specify the output directory, where they want the difference in the two files being compared, to be output to.
</li>
<li>
Compfile is not only able to output the difference in a text file, but also sort them in alphabetical order, thereby making it easy to scan through the output results. A pentester or bug-bounty hunter can then decide to cut a specific alphabetical portion they wish to automate and feed it to their automation tool.
</li>
<li>
  What makes "compfile" amazing, is the fact that compfile can scan any directory with the text file extension, as long as they are appropriately specified. A perfect way to check the difference in your existing wordlist, and a newly downloaded database of wordlist, filtering the duplicates, and updating your list in alphabetic order... "let say a way of you being organized." 
</li>
<li>If only textfile name was specified, when the output location is demanded e.g. <strong>textme.txt</strong> without a path, the current directory the user is running compfile from would be the directory holding the output file.</li>
<br>
<strong>All these are conducted within the speed of light...irrespective of the file size...</strong>
<br><br>
<h2>HOW TO INSTALL</h2>

<li>git clone the repository</li>
<li>Install shc to make compfile.sh into a binary file locally on your machine.</li>
<li>run the command below to turn compfile.sh into binary</li>
<pre><code>shc -f compfile.sh -o compfile</code></pre>
<li>Next we type the command below, to move the binary file, to the 'bin' directory or file system. This directory is responsible for running all binary files.</li>
<pre><code>sudo mv compfile /usr/local/bin/compfile</code></pre>
<li>Then type the command below in the terminal from anywhere in your operating system (it doesn't matter whether you in the downloads directory, bin directory or not). This command is essential to make compfile an executable, else the tool will not run.</li>
<pre><code>sudo chmod +x /usr/local/bin/compfile</code></pre>
<li>If all was properly done, then typing the command below from anywhere in your terminal (i.e. filesystem or directory), will launch the tool.</li>
<pre><code>compfile</code></pre>
<h2>HOW TO USE</h2>
<li>Launch your terminal on your Linux Machine, and type the command below</li>
<pre><code>compfile</code></pre>
<li>Follow the onscreen instructions and provide the full path where the text file resides, and end it with a '*.txt' extension, for text files. See Example Below</li>
<pre><code>/home/user/filesystem_location/namefile.txt</code></pre> 
<br>
<blockquote><strong>See example below assuming the first textfile is in 'Desktop', and the second textfile is in 'Downloads' while the user is 'fixitgearwaresecurity'.</strong></blockquote>
<br>
<pre><code>/home/fixitgearwaresecurity/Desktop/recon1.txt</code></pre>
<pre><code>/home/fixitgearwaresecurity/Downloads/weekend1.txt</code></pre>
<h2>ERROR NOTIFICATION IF PATH IS MISSING</h2>
<li>If the file path is not appropriately specified for one/any/both of the files locations, the onscreen error shown below will be displayed. </li><br>

![](https://github.com/fixitgearware/compfile/blob/main/error.png)

<h2>NO DIFFERENCE IN COMPARED FILES NOTIFICATION</h2>
<li>If the two files being compared are the same file path;</li>
<li>If the two files compared are of different file path and name;  but the contents in them are the same, the notification screen below will be displayed.</li><br>

![](https://github.com/fixitgearware/compfile/blob/main/nochanges.png)

<h2>SUPPORTED OS's</h2>
<li>Tested on Kali Linux.</li>
<li>Tested on Ubuntu.</li>
<li>Tested on Linux OS's running on virtual machines.</li>
<h2>DISCLAIMER</h2>
<li>No packages required, just ensure your system update and upgrade is run before installing. To do that use the code below.</li>
<pre><code>sudo apt-get update && sudo apt-get upgrade -y</code></pre>
