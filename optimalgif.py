#!/usr/bin/env python3
"""GIF Optimizer.

Usage:
  gif_optimizer.py <filename>

Options:
  -h --help     Show this screen.
"""
from docopt import docopt
from PIL import Image, ImageSequence
import os


def optimize_gif(input_path):
    gif = Image.open(input_path)

    optimized_frames = []

    for frame in ImageSequence.Iterator(gif):
        # Copy the frame to ensure we're not just referencing it
        frame_copy = frame.copy()

        # Optimize the frame
        frame_copy = frame_copy.convert('P', palette=Image.ADAPTIVE)
        optimized_frames.append(frame_copy)

    # append "_optimized" before saving output file
    output_path = os.path.splitext(input_path)[0] + '_optimized.gif'

    optimized_frames[0].save(output_path, save_all=True,
                             append_images=optimized_frames[1:], optimize=True, loop=0)

    # Print out the original and optimized sizes
    original_size = os.path.getsize(input_path)
    optimized_size = os.path.getsize(output_path)
    print(f'Original size: {original_size} bytes')
    print(f'Optimized size: {optimized_size} bytes')


if __name__ == '__main__':
    arguments = docopt(__doc__)
    filename = arguments['<filename>']
    optimize_gif(filename)
