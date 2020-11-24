#!/usr/bin/env python3

import os
import exif
import sys

cwd = sys.argv[1]
files = os.listdir(cwd)

print('Program start.')

for i in files:
    filename_full = cwd + i
    filename, filename_ext = os.path.splitext(filename_full)
    if os.path.isfile(filename_full):
        #print('File exists.')
        iteration = 1
        remove_candidate = ''
        while (iteration < 100):
            filename_full_2 = filename + ' - ' + str(iteration) + filename_ext
            if os.path.isfile(filename_full_2):
                print('Duplicate detected.')
                image1 = exif.Image(filename_full)
                image2 = exif.Image(filename_full_2)
                image1_max = image1.pixel_x_dimension if image1.pixel_x_dimension > image1.pixel_y_dimension else image1.pixel_y_dimension
                image2_max = image2.pixel_x_dimension if image2.pixel_x_dimension > image2.pixel_y_dimension else image2.pixel_y_dimension

                if (image1_max > image2_max):
                    print('Deleting the second version. (' + filename_full_2 + ')')
                    remove_candidate = filename_full_2
                    iteration += 1
                elif (image2_max > image1_max):
                    print('Deleting the first version. (' + filename_full + ')')
                    remove_candidate = filename_full
                    iteration += 1
                else:
                    image1_size = os.path.getsize(filename_full)
                    image2_size = os.path.getsize(filename_full_2)

                    if image1_size > image2_size:
                        print(filename_full + ' is bigger than ' + filename_full_2)
                        remove_candidate = filename_full_2
                        iteration += 1
                    elif image2_size > image1_size:
                        print(filename_full_2 + ' is bigger than ' + filename_full)
                        remove_candidate = filename_full
                        iteration += 1
                    else:
                        print('Size is the same. Deleting copy.')
                        remove_candidate = filename_full_2
                        iteration += 1
            else:
                if not remove_candidate == '':
                    if len(sys.argv) == 3:
                        if sys.argv[2] == 'd':
                            print('Deleting ' + remove_candidate)
                            os.remove(remove_candidate)
                break

    else:
        print(i + ' is not valid. Skipping.')
