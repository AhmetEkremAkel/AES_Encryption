# FPGA Üzerinde Test yapmak için :

1-FPGA-test

# AES CTR

AES CTR mode :

![image](https://github.com/user-attachments/assets/a7db61e7-ce55-4e43-b55c-fa805b7206f3)


## **Complete Block Diagram**

![AES block diagram](https://github.com/user-attachments/assets/c80f2f60-3015-4204-9837-a4b1c92769f7)

## **Module hierarchy**

![image](https://github.com/user-attachments/assets/fe720734-9d2e-42d1-a736-81758567135d)


## Top module test bench results :

![image](https://github.com/user-attachments/assets/99d2f7f6-4bed-48cc-8218-faa92ef41a99)


## FPGA test results :

![image](https://github.com/user-attachments/assets/2037f4ee-1897-40f7-a0cd-49eb8ca85ef8)

![image](https://github.com/user-attachments/assets/d56dabc7-fd87-403d-ab1c-66b778417782)

![image](https://github.com/user-attachments/assets/b8c2cd1e-48a9-4f80-820d-79d9f767b756)


Explanation about the top module:

After the done signal arrives, whatever is in the data in the rising edge of the clk signal is regulated. After that, even if the data in changes, the data out after the process will be the regulated data.


