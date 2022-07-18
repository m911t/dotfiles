function upscale-waifu -a denoiselevel upscaleratio format inputf outputf -d "Upscale an anime picture. First argument is denoise level, second is upscale ratio, third is format, fourth is input file, and fifth is output file."
waifu2x-ncnn-vulkan -n $denoiselevel -s $upscaleratio -f $format -i $inputf -o $outputf
end
