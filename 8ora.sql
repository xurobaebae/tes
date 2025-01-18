Set serveroutput on
DECLARE
    -- Input variables
    v_nama VARCHAR2(100);
    v_jenis_buku VARCHAR2(20);
    v_jumlah_buku NUMBER;

    -- Constants for book prices
    c_harga_komik CONSTANT NUMBER := 20000;
    c_harga_novel CONSTANT NUMBER := 35000;
    c_harga_program CONSTANT NUMBER := 50000;

    -- Variables for calculation
    v_harga_buku NUMBER;
    v_diskon NUMBER := 0;
    v_total NUMBER;
BEGIN
    -- Bagian Input
    v_nama := 'Masukkan Nama';
    v_jenis_buku := 'Komik'; -- Ganti sesuai input: 'Komik', 'Novel', 'Program'
    v_jumlah_buku := 60; -- Ganti sesuai input

    -- Menentukan harga buku berdasarkan jenis buku
    IF v_jenis_buku = 'Komik' THEN
        v_harga_buku := c_harga_komik;
    ELSIF v_jenis_buku = 'Novel' THEN
        v_harga_buku := c_harga_novel;
    ELSIF v_jenis_buku = 'Program' THEN
        v_harga_buku := c_harga_program;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Jenis buku tidak valid.');
        RETURN;
    END IF;

    -- Menentukan diskon berdasarkan jumlah pembelian buku
    IF v_jumlah_buku < 50 THEN
        v_diskon := 0;
    ELSIF v_jumlah_buku BETWEEN 50 AND 100 THEN
        v_diskon := 0.1;
    ELSIF v_jumlah_buku BETWEEN 101 AND 250 THEN
        v_diskon := 0.15;
    ELSE
        v_diskon := 0.25;
    END IF;

    -- Menghitung total pembayaran
    v_total := (v_harga_buku * v_jumlah_buku) - (v_harga_buku * v_jumlah_buku * v_diskon);

    -- Bagian Output
    DBMS_OUTPUT.PUT_LINE('Nama                           : ' || v_nama);
    DBMS_OUTPUT.PUT_LINE('Jenis buku yang dibeli         : ' || v_jenis_buku);
    DBMS_OUTPUT.PUT_LINE('Jumlah buku                    : ' || v_jumlah_buku);
    DBMS_OUTPUT.PUT_LINE('Diskon                         : ' || TO_CHAR(v_diskon * 100) || '%');
    DBMS_OUTPUT.PUT_LINE('Total pembayaran               : Rp' || TO_CHAR(v_total, '999G999G999'));  
END;
/