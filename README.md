# Image Naming based on Date

## Abstract
Imagine you have used an iPhone for your entire life. Now imagine you have been backuping all of its photos and videos in the Photos app on your Mac when, all of a sudden, you decided to install Windows because semester is over (yay!). Guess what? You lost all of the Mac partitions just because you need to expand the Windows storage in order to be able to play the new Modern Warfare. You then managed to get nearly all of the photos back by using free partition recovery software. What did that leave you with? A huge 64gb load of mess. That includes all photo thumbnails of various sizes, even thumbnails of your insta stories, stored in JPEG. Not even the original .HEIC is preserved, what the hell?

With this program, I wanted to solve the date classification by putting the date in front of the filename, so that the file explorer will show the earlier photo first. With this, one may resort its photos into albums quickly.

## New version?
With the coronavirus being around, I think that it is wise to do a spring cleaning of all my repositories. Moreover, I also have a private Git server somewhere in the nearest city-state (it's Singapore!), and I have been putting all of my projects (namely the bash-made OS-agnostic LaTeX watchdog) there. I think that this project does deserve some justice because:
- Google Photos considered closing their free unlimited 'high-quality' photo storage service,
- My Digital Imaging class affirms me to use and like Python (am a diehard C fan!) and therefore getting in touch with libraries such as OpenCV and Seaborn,
- I have been looking on EXIF Specifications for a while, even chatted my kating about what the professor will teach on the Digital Imaging class (hint: not what I have imagined but still fun),
- and I still have a lot of memories on my photo library to search and delete for. It still hurts, okay?

Enter imageNaming. I know it is currently a working name and I do not think that I will be getting serious, but for archiving purposes I am putting it here. What it basically does is that it names your pictures according to the date and time it is taken.

## Operating procedures
- `imageName.py <photo-dir> <number-to-start-from>`
- `imageSort.py <photo-dir>`
- And if it turned out that you have duplicated photos, `imageDuplicate.py <photo-dir>` will tell you if you have it or not.
- The previous command is not destructive, so if it turns out that you have duplicated photos and wanted to keep the best quality, you can just append `d` so that it deletes the duplicates. (`imageDuplicate.py <photo-dir> d`)

Requirements:
- Python 3's EXIF library
- \*NIX (I mean, you know WinXP's source code was maintained on a Red Hat desktop, right?)

With all being said, have fun! It's not a serious project, btw. You might wanna keep an eye on other repos.
