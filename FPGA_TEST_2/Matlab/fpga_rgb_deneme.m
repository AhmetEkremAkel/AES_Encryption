clc;
clear;

%% 1) RGB görüntüyü oku
img = imread('siyahsenek.png'); % RGB resim
[rows, cols, channels] = size(img);

%% 2) Boyutu 8’in katı yap (sıfır dolgusu ile)
pad_rows = mod(8 - mod(rows,8), 8);
pad_cols = mod(8 - mod(cols,8), 8);

padded_img = zeros(rows + pad_rows, cols + pad_cols, channels, 'uint8');
padded_img(1:rows, 1:cols, :) = img;

new_rows = size(padded_img,1);
new_cols = size(padded_img,2);

nBlocksRow = new_rows / 8;
nBlocksCol = new_cols / 8;

%% 3) Sonuç matrislerini hazırla
enc_full  = zeros(new_rows, new_cols, channels, 'uint8');  
fpga_full = zeros(new_rows, new_cols, channels, 'uint8'); 

%% 4) Seri portu aç
portName = "COM6"; % Doğru port numarasını buraya gir!
baudRate = 115200;
sp = serialport(portName, baudRate, "Timeout", 10);
flush(sp);

expectedBytes = 128 * channels;   % RGB her bloktan dönecek veri (3 kanal için)

%% 5) RGB Blok-blok gönder / al / birleştir
for r = 1:nBlocksRow
    for c = 1:nBlocksCol

        enc_block  = zeros(8,8,channels,'uint8');
        fpga_block = zeros(8,8,channels,'uint8');
        
        for ch = 1:channels  % RGB için her kanal ayrı gönder
            % --- 5a) 8×8 bloğu çıkar
            rIdx = (r-1)*8 + (1:8);
            cIdx = (c-1)*8 + (1:8);
            block = padded_img(rIdx, cIdx, ch);
            
            % --- 5b) Bloğu gönder
            write(sp, block(:), "uint8"); % 64 bayt gönder
            
            % --- 5c) FPGA’dan cevap oku
            while sp.NumBytesAvailable < expectedBytes/channels
                pause(0.001);
            end
            rxData = read(sp, expectedBytes/channels, "uint8");
            
            % --- 5d) Dönen veriyi ayır & yeniden şekillendir
            enc_block(:,:,ch)  = reshape(rxData(1:64), [8 8]);
            fpga_block(:,:,ch) = reshape(rxData(65:128), [8 8]);
        end
        
        % --- 5e) Sonuç matrislerine yerleştir
        enc_full(rIdx, cIdx, :) = enc_block;
        fpga_full(rIdx, cIdx, :) = fpga_block;
        
    end
end

%% 6) Portu kapat
clear sp;

%% 7) Dolgu varsa kırp ve görüntüle
enc_img_final  = enc_full(1:rows, 1:cols, :);
fpga_img_final = fpga_full(1:rows, 1:cols, :);

figure('Name','FPGA RGB Çıktılar','NumberTitle','off');

subplot(1,3,1);
imshow(img); title(sprintf('Orijinal RGB (%dx%d)', rows, cols));

subplot(1,3,2);
imshow(enc_img_final); title('Şifreli RGB Görüntü');

subplot(1,3,3);
imshow(fpga_img_final); title('FPGA 2. RGB Çıktısı');
