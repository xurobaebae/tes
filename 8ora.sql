SET SERVEROUTPUT ON;
DECLARE
    -- Variabel untuk input pengguna
    v_nama VARCHAR2(100);
    v_jenis_buku VARCHAR2(20);
    v_jumlah_buku NUMBER;

    -- Konstanta untuk harga buku
    c_harga_komik CONSTANT NUMBER := 20000;
    c_harga_novel CONSTANT NUMBER := 35000;
    c_harga_program CONSTANT NUMBER := 50000;

    -- Variabel untuk perhitungan
    v_harga_buku NUMBER;
    v_diskon NUMBER := 0;
    v_total NUMBER;
BEGIN
    -- Input dari pengguna
    v_nama := '&v_nama';
    v_jenis_buku := '&v_jenis_buku'; -- Masukkan 'Komik', 'Novel', atau 'Program'
    v_jumlah_buku := &v_jumlah_buku; -- Masukkan jumlah buku

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

    -- Menampilkan output dengan format kotak
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('MASUKKAN NAMA ANDA           : ' || v_nama);
    DBMS_OUTPUT.PUT_LINE('MASUKKAN JENIS BUKU          : ' || v_jenis_buku);
    DBMS_OUTPUT.PUT_LINE('MASUKKAN JUMLAH PEMBELIAN BUKU : ' || v_jumlah_buku);
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('NAMA                         : ' || v_nama);
    DBMS_OUTPUT.PUT_LINE('JENIS BUKU YANG DIBELI       : ' || v_jenis_buku);
    DBMS_OUTPUT.PUT_LINE('JUMLAH BUKU                  : ' || v_jumlah_buku);
    DBMS_OUTPUT.PUT_LINE('DISKON                       : ' || TO_CHAR(v_diskon * 100) || '%');
    DBMS_OUTPUT.PUT_LINE('TOTAL PEMBAYARAN             : Rp' || TO_CHAR(v_total, '999G999G999'));
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
END;
/
