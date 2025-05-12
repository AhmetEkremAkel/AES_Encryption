# FPGA Üzerinde Test yapmak için :

1 - top_AES_CTR ve tüm alt modullerini ve uart modullerini aynı projede açın.

2 - top_FPGA_test modulunu de kurun ve top modul seçin.

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
![image](https://github.com/user-attachments/assets/e9e7181c-4196-464e-8dbb-0775b3bed0a1)



Explanation about the top module:

After the done signal arrives, whatever is in the data in the rising edge of the clk signal is regulated. After that, even if the data in changes, the data out after the process will be the regulated data.


