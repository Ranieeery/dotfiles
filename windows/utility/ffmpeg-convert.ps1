# Convert video to mp4 to mkv
ffmpeg -i input.mp4 -c copy output.mkv

# Convert video to mp4 to mkv with subtitles
ffmpeg -i input.mp4 -i input.srt -c copy -c:s mov_text output.mkv

# Convert video to audio file
ffmpeg -i input.mp4 -vn -c:a libmp3lame -q:a 0 output.mp3

# Resize image scale
ffmpeg -i input.png -vf "scale=iw/2:ih/2" output.png

# Reduce image size
ffmpeg -i input.png -compression_level 9 -pred mixed -vf "format=rgba,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" output.png

# Cut video in HH:MM:SS format
ffmpeg -i input.mp4 -t 00:00:02 output.mp4
