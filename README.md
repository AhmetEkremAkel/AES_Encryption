#AES CTR

## **Complete Block Diagram**

![AES block diagram](https://github.com/user-attachments/assets/c80f2f60-3015-4204-9837-a4b1c92769f7)

##**Module hierarchy**

![image](https://github.com/user-attachments/assets/fe720734-9d2e-42d1-a736-81758567135d)


## Top module test bench results :

![image](https://github.com/user-attachments/assets/99d2f7f6-4bed-48cc-8218-faa92ef41a99)

Explanation about the top module:

After the done signal arrives, whatever is in the data in the rising edge of the clk signal is regulated. After that, even if the data in changes, the data out after the process will be the regulated data.
