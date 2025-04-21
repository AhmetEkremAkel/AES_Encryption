Chiper text done sinyali geldiği zamanki data_in ile encrption blockun çıkışındaki sinyallerin XOR lanmasından ibarettir. Bu yüzden canlı şifreleme yapılırken (Yani hem encryption blocuk çıktıları hesaplanıp hemde plain text verilirken) iki done sinyali arasında bir sonraki şifrelenmek istenen plain text verilebilir.

![image](https://github.com/user-attachments/assets/6d8132b6-9705-43ed-a55e-2812d7e6c1c9)

Yukardaki simulasyon çıktısındaki gibi data_in ik done sinyali arasında bir zamanda verilmelidir.

Simulasyon için bir top modul yazdım.
Bu modulde direkt olarak encryptin outputunu decrypte bagladım.
Decryptin veriyi biraz geç alması için start bitini start_2 yaptım ve 10 cycle sonra başlattım.


![image](https://github.com/user-attachments/assets/a9ea7f25-0a93-4055-b6e5-1693bacb5498)
