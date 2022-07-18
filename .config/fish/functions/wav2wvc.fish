function wav2wvc -a userThreads bitrate extraCompressionLevel outputFolder -d "Convert wav files into hybrid wavpack files. Pass a number as first argument to use that many threads or 0 to use all available threads. Second argument is bitrate, third is the extra compression level. Fourth is output folder."
	set numberFiles (find . -name \*.wav | wc -l)
	if [ $userThreads -ne 0 ]
		set threads $userThreads
	else
		set threads (nproc)
	end
	set filesPerFolder (math -s 0 $numberFiles / $threads)
	set extraFilesForLastFolder (math $numberFiles % $threads)
	while [ $threads -gt 0 ] # create le folders according to le threads
		mkdir -p $threads
		set threads (math $threads - 1)
	end
	find . -name \*.wav -fprint fileList.tmp

	set songCounter 1
	set folderCounter 1
	while [ $folderCounter -le (nproc) ] # copying files to the numbered folders
		while [ $songCounter -le (math $filesPerFolder x $folderCounter) ]
			cp (sed -n $songCounter\P fileList.tmp) $folderCounter/
			set songCounter (math $songCounter + 1)
		end
		if [ $folderCounter -eq (nproc) ]
			set filesPerFolder (math $filesPerFolder x $folderCounter + $extraFilesForLastFolder)
			while [ $songCounter -le $filesPerFolder ]
				cp (sed -n $songCounter\P fileList.tmp) $folderCounter/
				set songCounter (math $songCounter + 1)
			end
		end
	set folderCounter (math $folderCounter + 1)
	end

	if [ $userThreads -ne 0 ]
		set threads $userThreads
	else
		set threads (nproc)
	end

	while [ $threads -gt 0 ] # actual compression process
		find $threads/ -name \*.wav -execdir wavpack -q --allow-huge-tags -b$bitrate -hh -x$extraCompressionLevel -c --import-id3 -m -v -w Encoder -w Settings {} -o $outputFolder/{}.temp \; -execdir wvgain -q $outputFolder/{}.temp \; &
		set threads (math $threads - 1)
	end
	
	if [ $userThreads -ne 0 ]
		set threads $userThreads
	else
		set threads (nproc)
	end
end
