from weights import w1, w2
from images import im1, im4, im6, im7, im9


def int_to_bin(number, bw):
    if(number >= 0):
        b = bin(number)
        b = '0' * (bw + 2 - len(b)) + b
    else:
        b=2**(bw) + number
        b=bin(b)
        b = '1' * (bw + 2 - len(b)) + b
    b = b.replace('0b', '')
    b = b.replace('-', '')
    return b


# The following code will be specific to your SRAM organization. Here is just one possible strategy.

def weight_to_bin(w):
    binfile = ''
    for j in range(len(w[0])):
        line = ''
        for i in range(10):
            line = int_to_bin(w[i][j], 8) + ('_' if i != 0 else '') + line
        binfile += line + '\n'
    return binfile


def image_to_bin(im):
    binfile = ''
    for i in range(100):
        binfile += int_to_bin(im[i], 8) + '\n'
    return binfile


if __name__ == '__main__':
    with open('im.bin', 'w') as f:
        # generate binfile for im6
        f.write(image_to_bin(im6))

    with open('w1.bin', 'w') as f:
        f.write(weight_to_bin(w1))

    with open('w2.bin', 'w') as f:
        f.write(weight_to_bin(w2))
