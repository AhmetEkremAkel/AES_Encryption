clc;
clear;

%% 1) Görseli oku ve gri formata çevir
img       = imread('denemePNG_03.png');   % Dosya yolunuzu güncelleyin
gray_img  = rgb2gray(img);                  % Renkliyse gri tonlama

[rows, cols] = size(gray_img);

%% 2) Boyutu 8’in katı yap (padarray yerine kendi sıfır dolgusu)
pad_rows = mod(8 - mod(rows,8), 8);
pad_cols = mod(8 - mod(cols,8), 8);

padded_img = uint8( ...
    padarray(gray_img, [pad_rows pad_cols], 0, 'post') );   % 0 ile doldur

new_rows = size(padded_img,1);
new_cols = size(padded_img,2);

nBlocksRow = new_rows / 8;
nBlocksCol = new_cols / 8;

%% 3) Sonuç matrislerini hazırla
enc_full  = zeros(new_rows, new_cols, 'uint8');  % Şifreli tam resim
fpga_full = zeros(new_rows, new_cols, 'uint8');  % FPGA 2. çıktı

%% 4) Seri portu aç
portName = "COM7";
baudRate = 115200;
sp = serialport(portName, baudRate, "Timeout", 10);
flush(sp);

expectedBytes = 128;   % Her bloktan dönecek veri

%% 5) Blok-blok gönder / al / birleştir
for r = 1:nBlocksRow
    for c = 1:nBlocksCol
        
        % --- 5a) 8×8 bloğu çıkar
        rIdx = (r-1)*8 + (1:8);
        cIdx = (c-1)*8 + (1:8);
        block = padded_img(rIdx, cIdx);
        
        % --- 5b) Bloğu gönder
        write(sp, block(:), "uint8");    % 64 bayt
        
        % --- 5c) FPGA’dan cevap oku
        while sp.NumBytesAvailable < expectedBytes
            pause(0.001);
        end
        rxData = read(sp, expectedBytes, "uint8");
        
        % --- 5d) Dönen veriyi ayır & yeniden şekillendir
        enc_block  = reshape(rxData(1:64) , [8 8]);
        fpga_block = reshape(rxData(65:128), [8 8]);
        
        % --- 5e) Sonuç matrislerine yerleştir
        enc_full (rIdx, cIdx) = enc_block;
        fpga_full(rIdx, cIdx) = fpga_block;
        
    end
end

%% 6) Portu kapat
clear sp;

%% 7) Dolgu varsa kırp ve görüntüle
enc_img_final  = enc_full (1:rows, 1:cols);
fpga_img_final = fpga_full(1:rows, 1:cols);

figure('Name','FPGA Toplu Çıktılar','NumberTitle','off');

subplot(1,3,1);
imshow(gray_img,  []); title(sprintf('Orijinal %dx%d', rows, cols));

subplot(1,3,2);
imshow(enc_img_final, []); title('Şifreli Görüntü (Tümü)');

subplot(1,3,3);
imshow(fpga_img_final, []); title('FPGA 2. Çıktı (Tümü)');

%% (Opsiyonel) İlk bloğun hex çıktısını yazdır

hex_tx  = sprintf('%02X ', padded_img(1:8,1:8));
hex_enc = sprintf('%02X ', enc_full (1:8,1:8));
hex_fp  = sprintf('%02X ', fpga_full(1:8,1:8));

disp('--- İlk Bloğun Gönderilen 64 Baytı ---');  disp(hex_tx);
disp('--- İlk Bloğun Şifreli 64 Baytı ---');     disp(hex_enc);
disp('--- İlk Bloğun FPGA 2. Çıktısı 64 Baytı ---'); disp(hex_fp);

