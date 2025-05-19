The ciphertext is simply the result of XOR'ing the data_in value at the moment the done signal is asserted with the output of the encryption block. This XOR result is then written into the data_out register.

Therefore, during live encryption (i.e., when both the encryption block is computing outputs and plaintext is being fed), the plaintext to be encrypted must be provided between two rising edges of the done signal.

![image](https://github.com/user-attachments/assets/6d8132b6-9705-43ed-a55e-2812d7e6c1c9)

To simulate this behavior, I wrote a top-level module where the output of the encryption block is directly connected to the input of the decryption block. To delay the decryption process slightly, I triggered the decryption's start signal using a separate start_2 signal, which activates 10 clock cycles after the encryption starts.

![image](https://github.com/user-attachments/assets/a9ea7f25-0a93-4055-b6e5-1693bacb5498)

The ciphertext output matched the result from online AES-CTR tools.
The decrypted output was exactly the same as the original plaintext.
This confirms that both the encryption and decryption modules function correctly.
