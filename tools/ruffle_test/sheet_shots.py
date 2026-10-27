import sys, glob, os
from PIL import Image, ImageDraw
prefix, out = sys.argv[1], sys.argv[2]
files = sorted(glob.glob(prefix + '*.png'))
cols = 5; tw, th = 320, 190
S = Image.new('RGB', (cols * tw, ((len(files) + cols - 1) // cols) * (th + 12)))
d = ImageDraw.Draw(S)
for k, f in enumerate(files):
    im = Image.open(f).crop((0, 0, 800, 520)).resize((tw, int(520 * tw / 800)))
    im = im.crop((0, 0, tw, th))
    x, y = (k % cols) * tw, (k // cols) * (th + 12)
    S.paste(im, (x, y + 12)); d.text((x + 2, y), os.path.basename(f)[len(os.path.basename(prefix)):], fill=(255, 255, 0))
S.save(out); print(len(files), S.size)
