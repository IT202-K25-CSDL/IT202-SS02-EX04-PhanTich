CREATE TABLE IF NOT EXISTS USERS (
    UserID   INT PRIMARY KEY,
    FullName VARCHAR(100),
    Phone    INT
);

ALTER TABLE USERS
MODIFY COLUMN Phone VARCHAR(15);

UPDATE USERS
SET Phone = LPAD(Phone, 10, '0')
WHERE UserID > 0;

SELECT * FROM USERS;
-- BIGINT: Tiết kiệm dung lượng lưu trữ hơn một chút. Mất số 0 ở đầu, không lưu được mã quốc tế dạng chuỗi, tính linh hoạt thấp
-- VARCHAR: Lưu được số 0 ở đầu, tốn thêm vài byte dũ liệu cho mỗi bản ghi, tính linh hoạt cao
-- Quyết định: Chọn VARCHAR. Mặc dù tốn thêm một ít dung lượng, nhưng đây là lựa chọn duy nhất đảm bảo tính toàn vẹn dữ liệu
