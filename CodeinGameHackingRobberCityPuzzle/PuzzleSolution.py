# PuzzleSolution.py
# Author: Grace Choe
# Created: July, 22 2024

import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

message_1 = input()  # Alice coded message
message_2 = input()  # Alice and Bob coded message
message_3 = input()  # Bob coded message

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

# Convert the hexadecimal to int
message_1_int = int(message_1, 16)
message_2_int = int(message_2, 16)
message_3_int = int(message_3, 16)

# XOR message 2 and 1 to get only the Bob coded message (undoes the Alice coding XOR since undoing an XOR is XOR'ing again)
message_2_int = message_2_int ^ message_1_int
# XOR the XOR'ed message 2 and 3 to get only the coded message (undoes the Bob coding XOR)
message_2_int = message_2_int ^ message_3_int
final_message_hex = hex(message_2_int)[2:]  # Convert the final message back into a hex

ascii = ""  # String to hold the ascii value of the message

# for loop for converting hexadecimal to ascii
# Done by two digits at a time since one ascii char is made of two hexadecimal values (since ascii values are form 0-255)
for i in range(0, len(final_message_hex), 2):
    part = final_message_hex[i : i + 2]
    char = chr(int(part, 16))
 
    ascii += char

# Prints the resulting ascii string
print(ascii)

# print("clear message")
