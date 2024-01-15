# rearrange_ctile.py
# Utility to rearrange the order of data within a .ctile file,
# moving each row of attribute bytes to follow the pixel bytes

with open("bifrost2.ctile", mode="rb") as file:

    output = bytearray()

    while True:
        pixels = file.read(32)
        attributes = file.read(32)
        if len(pixels) != 32 or len(attributes) != 32:
            break
        for i in range(0, 32, 2):
            output += bytearray(pixels[i:i+2])
            output += bytearray(attributes[i:i+2])

    print(len(output))
    with open("bifrost2.bin", "wb") as binary_file:
        binary_file.write(output)
