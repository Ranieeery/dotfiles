# Download the best video and audio quality from a YouTube video
yt-dlp -f bestvideo+bestaudio/best -n 5 https://www.youtube.com/watch?xxxxxxxxxx

# Download the best video and audio quality from a YouTube video and save it to a specific folder
yt-dlp -f bestvideo+bestaudio/best -n 5 -o "C:/Downloads/x/%(title)s.%(ext)s" https://www.youtube.com/watch?xxxxxxxxxx