# Convert video to mp4 to mkv
ffmpeg -i input.mp4 -c copy output.mkv

# Convert video to mp4 to mkv with subtitles
ffmpeg -i input.mp4 -i input.srt -c copy -c:s mov_text output.mkv